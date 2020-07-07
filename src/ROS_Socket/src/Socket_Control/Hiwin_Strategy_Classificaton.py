#!/usr/bin/env python3
# license removed for brevity
#策略 機械手臂 四點來回跑
import sys
sys.path.insert(1, "/home/iclab/.local/lib/python3.6/site-packages/")
sys.path.insert(0, '/opt/installer/open_cv/cv_bridge/lib/python3/dist-packages/')

import threading
import time
import rospy
import os
import numpy as np
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point
from geometry_msgs.msg import PoseStamped
from darknet_ros_msgs.msg import BoundingBox
from darknet_ros_msgs.msg import BoundingBoxes
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String
from ROS_Socket.srv import *
from getcalue.srv import *
from ROS_Socket.msg import *
import math
import enum
import Hiwin_RT605_Socket as ArmTask
from std_msgs.msg import Int32MultiArray
from get_rs_image.srv import *

##----Arm state-----------
Arm_state_flag = 0
Strategy_flag = 0
Sent_data_flag = 1
##----Arm sttus enum
class Arm_status(enum.IntEnum):
    Idle = 0
    Isbusy = 1
    Error = 2
    shutdown = 6
def callback(state):
    global Arm_state_flag,Sent_data_flag
    Arm_state_flag = state.data[0]
    Sent_data_flag = state.data[1]
def arm_state_listener():

    rospy.Subscriber("chatter", Int32MultiArray, callback)
##-----------switch define------------##
class switch(object):
    def __init__(self, value):
        self.value = value
        self.fall = False

    def __iter__(self):
        """Return the match method once, then stop"""
        yield self.match
        raise StopIteration

    def match(self, *args):
        """Indicate whether or not to enter a case suite"""
        if self.fall or not args:
            return True
        elif self.value in args: # changed for v1.5, see below
            self.fall = True
            return True
        else:
            return False

##------------class-------
class point():
    def __init__(self,x,y,z,pitch,roll,yaw):
        self.x = x
        self.y = y
        self.z = z
        self.pitch = pitch
        self.roll = roll
        self.yaw = yaw
pos = point(0,36.8,11.35,-90,0,0)

class get_point():
    def __init__(self,label,x_max,x_min,y_max,y_min,down_z,center_x,center_y):
        self.label = label
        self.x_max = x_max
        self.x_min = x_min
        self.y_max = y_max
        self.y_min = y_min
        self.down_z = down_z
        self.center_x = center_x 
        self.center_y = center_y

image_point = get_point('bottle',10,0,10,0,5,0,0)

class get_center_point():
    def __init__(self,center_point_x,center_point_y,z_depth):
        self.center_point_x = center_point_x
        self.center_point_y = center_point_y 
        self.z_depth = z_depth

global cntr_point
cntr_point = get_center_point(0,0,0)


class get_depth_point():
    def __init__(self,x,y,w,h,depth):
        self.x = x
        self.y = y
        self.w = w
        self.h = h
        self.depth = depth
resp1 = get_depth_point(0.0,0.0,0.0,0.0,0.0)

class star_cfg():
    def __init__(self,yolo_z,down_z):
        self.yolo_z = yolo_z    # === need to change to avoid sucker hit the box ===
        self.down_z = down_z    # receive what realsense got z
star_config = star_cfg(-1.65,0)

class bounding_boxes():
    def __init__(self,probability,xmin,ymin,xmax,ymax,id_name,Class_name):
        self.probability = probability
        self.xmin = xmin
        self.ymin = ymin
        self.xmax = xmax
        self.ymax = ymax
        self.id_name = str(id_name)
        self.Class_name = str(Class_name)

boxes = bounding_boxes(0,0,0,0,0,0,0) 

class coordinate_normal():
    def __init__(self,x,y,z,normal_x,normal_y,normal_z):
        self.x = x
        self.y = y
        self.z = z
        self.normal_x = normal_x
        self.normal_y = normal_y
        self.normal_z = normal_z

normal = coordinate_normal(0,0,0,0,0,0)

#count times that camera see
class class_label():  
    def __init__(self,metal,bottle,paper):
        self.metal = metal
        self.bottle = bottle
        self.paper = paper

label = class_label(0,0,0)
##-------------------------strategy---------------------
action = 0

Depth_Bridge = CvBridge()
global Depth_Image
Depth_Image =  np.zeros((720,1280,1), np.float32)

item_name = ''
get_image_flag = 0  #only to action 1 that receive yolo,s information

item_center_x = 0 
item_center_y = 0
center_x = 0      #calculated item position
center_y = 0



temp_metal = 0 #check 3 times to ensure what camera see
temp_bottle = 0
teemp_paper = 0

diff_item = 1     #check what image yolo got(metal,bottle......)
down_stop_flag = 1 #Arm stop when sucker already suck something
picture_count = 0 #caculate what times webcam need to identify the item
switch_flag = 0 #when yolo cant see change method to realsense

count_stop = 0    #decide what times need to run
suck_point = 0    #when realsense gave me a suck point (move realsense to see a new image) *********************************
change_position = 0

pressure_info = ""

def callback_receive_sucker(data):   #read the value of pressure
    global down_stop_flag,pressure_info
    pressure_info = data.data
    down_stop_flag = int(pressure_info)
    
def realsense_look():      #get what realsense see (depth need to fix)
    global suck_point,switch_flag,cntr_point
    x, y, w, h, depth = 0.0,0.0,0.0,0.0,0.0
    if switch_flag == 1:
        while(x == 0.0 and y == 0.0):
            x, y, w, h, depth = call_selective_search(1) #for realsense
        print("use realsense")
        print("x, y, w, h, depth", x, y, w, h, depth)
        cntr_point.center_point_x = x+w/2
        cntr_point.center_point_y = y+h/2
        cntr_point.center_point_x = 0.05783*cntr_point.center_point_x - 32.78
        cntr_point.center_point_y = -0.05872*cntr_point.center_point_y + 76.53 
        cntr_point.z_depth = -12
        if cntr_point.center_point_x < -10.5 or cntr_point.center_point_x > 19 or cntr_point.center_point_y < 46 or cntr_point.center_point_y > 64:   #edit box edge x & y
            cntr_point.center_point_x = 4.5
            cntr_point.center_point_y = 55.5
    
    #eliminate the bias when realsense change its position
    if suck_point == 1:     #front
        cntr_point.center_point_x = cntr_point.center_point_x
        cntr_point.center_point_y = cntr_point.center_point_y +3
    elif suck_point == 2:  #rear
        cntr_point.center_point_x = cntr_point.center_point_x
        cntr_point.center_point_y = cntr_point.center_point_y -3
    elif suck_point == 3:  #front(down)
        cntr_point.center_point_x = cntr_point.center_point_x 
        cntr_point.center_point_y = cntr_point.center_point_y +3
    elif suck_point == 4:  #rear(down)
        cntr_point.center_point_x = cntr_point.center_point_x 
        cntr_point.center_point_y = cntr_point.center_point_y -3
    else:
        cntr_point.center_point_x = cntr_point.center_point_x 
        cntr_point.center_point_y = cntr_point.center_point_y 

        
    if cntr_point.center_point_x > 17.5:
        cntr_point.center_point_x = cntr_point.center_point_x -2
    if cntr_point.center_point_x < -7:
        cntr_point.center_point_x = cntr_point.center_point_x +2
    if cntr_point.center_point_y  > 63:
        cntr_point.center_point_y = cntr_point.center_point_y -3
    if cntr_point.center_point_y  < 46:
        cntr_point.center_point_y = cntr_point.center_point_y +3


    cntr_point.z_depth =  -1*cntr_point.z_depth +14.35 +8
    if math.isnan(cntr_point.z_depth):
        cntr_point.z_depth = -12             
    #check inf
    elif math.isinf(cntr_point.z_depth):
        cntr_point.z_depth = -12
        if cntr_point.center_point_x > 18.5:
            cntr_point.center_point_x = cntr_point.center_point_x -2
        if cntr_point.center_point_x < -7:
            cntr_point.center_point_x = cntr_point.center_point_x +1
        if cntr_point.center_point_y  > 63:
            cntr_point.center_point_y = cntr_point.center_point_y -3
        if cntr_point.center_point_y  < 46.5:
            cntr_point.center_point_y = cntr_point.center_point_y +3
    elif cntr_point.z_depth >= -12:
        cntr_point.z_depth = -12
    else:
        pass
    
    print("===================label=================== : ",boxes.Class_name)
    print("center_point_x : ",cntr_point.center_point_x)
    print("center_point_y : ",cntr_point.center_point_y)
    print("depth : ",cntr_point.z_depth)
    print("===========================================")

def call_selective_search(input_key):   #for realsense caculate
    try:
        pub_Max = rospy.Publisher('/coordinate_limit_Max', Point, queue_size=10)
        pub_Min = rospy.Publisher('/coordinate_limit_min', Point, queue_size=10)

        rospy.wait_for_service('Selective_Search')
        resp1 = selective_search(input_key)
        if x < 441 or y < 207 or x+w > 961 or y+h > 518:
            cntr_point.center_point_x = 642
            cntr_point.center_point_y = 362     # when depth =  0.48
    
        # 15.8571429 pixel = 1 cm = 0.01 m

        # when depth = 0.405 
        #  
        # 18.2307692 pixel = 1 cm = 0.01 m

        # 1 depth  = 31.6483507 d_pixel  
        # when depth = 0.6 
        # 12.0593408 pixel = 1 cm 

        depth_limit_Max = 0.6
        depth_limit_min = 0.2
        Pixel2ToCm = (depth_limit_Max - resp1.depth) * 31.6483507 + 12.0593408
        Bias_RGBcamera_to_Depthcamera = 2.7
        PointCloud_x_min = ((resp1.x - 320) / Pixel2ToCm ) * 0.01 - (Bias_RGBcamera_to_Depthcamera) * 0.01
        PointCloud_y_min = ((resp1.y - 240) / Pixel2ToCm) * 0.01
        PointCloud_x_Max = (((resp1.x + resp1.w) - 320) / Pixel2ToCm) * 0.01 - (Bias_RGBcamera_to_Depthcamera) * 0.01
        PointCloud_y_Max = ((resp1.y + resp1.h - 240) / Pixel2ToCm) * 0.01

        pub_Max.publish(PointCloud_x_Max,PointCloud_y_Max,depth_limit_Max)
        pub_Min.publish(PointCloud_x_min,PointCloud_y_min,depth_limit_min)


        return resp1.x , resp1.y, resp1.w, resp1.h, resp1.depth

    except (rospy.ServiceException):
        print("Service call failed")
        resp1.x , resp1.y, resp1.w, resp1.h, resp1.depth = 0.0, 0.0, 0.0, 0.0, 0.0
        return resp1.x , resp1.y, resp1.w, resp1.h, resp1.depth

#==================================================================================================================================#
def calculate_arm_move():        #=== no need for now ===#
    global image_point,cntr_point,center_x,center_y
    global arm_center_x,arm_center_y,item_center_x,item_center_y

    item_center_x = image_point.center_x
    item_center_y = image_point.center_y

    if item_center_x > 1500 or item_center_x < 100: #safe range position
        item_center_x = 900
    if item_center_y > 1200 or item_center_y < 100:
        item_center_y = 900

    center_x = 0.07128*item_center_x - 47.98
    center_y = -0.08249*item_center_y + 84.28

def identify_item():
    global item_name,diff_item
    if item_name != None:
        if label.bottle > label.metal and label.bottle > label.paper:
            diff_item = 0
        elif label.paper > label.metal and label.paper > label.bottle:
            diff_item = 1
        elif label.metal > label.bottle and label.metal > label.paper:
            diff_item = 2    
    else:
        diff_item = 3
    print("diff_item: ",diff_item)


def callback_point(data): #get coordinate of what camera first see #===  use only object_name for now ===#
    global count_stop,get_image_flag,switch_flag,Depth_Image
    if get_image_flag == 1:
        image_point.label = ""
        my_data = data

        if len((my_data.ROI_list)) == 0:
            print("No Object Found!")
            switch_flag == 1
            print("change method to zed!")
        else:
            i = 0
            switch_flag = 1
            while switch_flag == 1:
                image_point.label =  my_data.ROI_list[i].object_name
                image_point.x_max = my_data.ROI_list[i].Max_x
                image_point.x_min = my_data.ROI_list[i].min_x
                image_point.y_max = my_data.ROI_list[i].Max_y
                image_point.y_min = my_data.ROI_list[i].min_y
                center_x, center_y = ((my_data.ROI_list[i].Max_x - my_data.ROI_list[i].min_x)/2) + my_data.ROI_list[i].min_x, ((my_data.ROI_list[i].Max_y - my_data.ROI_list[i].min_y)/2) + my_data.ROI_list[i].min_y
                cntr_point.center_point_x = center_x
                cntr_point.center_point_y = center_y
                cntr_point.center_point_x = 0.05783*cntr_point.center_point_x - 32.78
                cntr_point.center_point_y = -0.05872*cntr_point.center_point_y + 76.53
                center_depth = Depth_Image[int(center_y)][int(center_x)]
                print("center_depth!!!!!!!!!!!!!!!!!!!!!!!:", center_depth)
                cntr_point.z_depth = center_depth*100
                cntr_point.z_depth = -12 #plz delete

                if  i <= len((my_data.ROI_list)) and cntr_point.center_point_x < -15 or cntr_point.center_point_x > 23.5 or cntr_point.center_point_y < 41.5 or cntr_point.center_point_y > 68.5: #outside the box
                    switch_flag = 1
                    i = i+1
                    print("a")
                # elif i <= len((my_data.ROI_list)) and cntr_point.z_depth > 43.8:  #too low
                #     switch_flag = 1
                #     i = i+1
                #     print("b")
                elif i > len((my_data.ROI_list)):
                    switch_flag = 1
                    print("No any item can get!!!")
                    break
                else:    # correspond my requirement
                    switch_flag = 0
                    print("yolo found something")
                    get_image_flag = 0
                    break
###---------------new add 0702                        


def normal_callback(data):
    normal.x = data.pose.position.x
    normal.y = data.pose.position.y
    normal.z = data.pose.position.z
    normal.normal_x = data.pose.orientation.x
    normal.normal_y = data.pose.orientation.y
    normal.normal_z = data.pose.orientation.z

def depth_callback(depth_data):
    global Depth_Image
    DI = Depth_Bridge.imgmsg_to_cv2(depth_data, "16UC1")
    Depth_Image = np.array(DI, dtype=np.float32)

def Yolo_callback(data):
    global count_stop,get_image_flag,switch_flag,Depth_Image
    if get_image_flag == 1:
        if len((data.bounding_boxes)) == 0:
            print("No Object Found!")
            switch_flag == 1
            print("change method to Realsense!")
        else:
            i = 0
            switch_flag = 1
            while switch_flag == 1:
                boxes.probability = data.bounding_boxes[i].probability
                boxes.xmin = data.bounding_boxes[i].xmin
                boxes.ymin = data.bounding_boxes[i].ymin
                boxes.xmax = data.bounding_boxes[i].xmax
                boxes.ymax = data.bounding_boxes[i].ymax
                boxes.id_name = data.bounding_boxes[i].id
                boxes.Class_name = data.bounding_boxes[i].Class
                center_x, center_y = ((boxes.xmax-boxes.xmin)/2)+boxes.xmin,((boxes.ymax - boxes.ymin)/2) + boxes.ymin
                cntr_point.center_point_x = center_x
                cntr_point.center_point_y = center_y
                cntr_point.center_point_x = 0.05783*cntr_point.center_point_x - 32.78
                cntr_point.center_point_y = -0.05872*cntr_point.center_point_y + 76.53
                center_depth = Depth_Image[int(center_y)][int(center_x)]
                print("center_depth!!!!!!!!!!!!!!!!!!!!!!!:", center_depth)
                cntr_point.z_depth = center_depth*100
                cntr_point.z_depth = -12 #plz delete

                if  i <= len((my_data.ROI_list)) and cntr_point.center_point_x < -15 or cntr_point.center_point_x > 23.5 or cntr_point.center_point_y < 41.5 or cntr_point.center_point_y > 68.5: #outside the box
                    switch_flag = 1
                    i = i+1
                    print("a")
                elif i <= len((my_data.ROI_list)) and cntr_point.z_depth > 43.8:  #too low
                    switch_flag = 1
                    i = i+1
                    print("b")
                elif i > len((my_data.ROI_list)):
                    switch_flag = 1
                    print("No any item can get!!!")
                    break
                else:    # correspond my requirement
                    switch_flag = 0
                    print("yolo found something")
                    get_image_flag = 0
                    break
###---------------new add 0702            
def yolo_receive():  #print what yolo see
    global temp_bottle,temp_metal,temp_paper
    cant_see_flag = 1
    while cant_see_flag == 1:

        temp_metal = 0 #initial
        temp_bottle = 0
        temp_paper = 0

        for i in range (9):
            if boxes.Class_name == "paper":
                temp_paper = temp_paper +1
            elif boxes.Class_name == "bottle":
                temp_bottle = temp_bottle +1
            elif boxes.Class_name == "metal":
                temp_metal = temp_metal +1

        if temp_bottle > temp_metal and temp_bottle > temp_paper:
            boxes.Class_name = "bottle"
            cant_see_flag = 0
        elif temp_paper > temp_metal and temp_paper > temp_bottle:
            boxes.Class_name = "paper"
            cant_see_flag = 0
        elif temp_metal > temp_bottle and temp_metal > temp_paper:
            boxes.Class_name = "metal" 
            cant_see_flag = 0
        else:
            cant_see_flag = 1
               
    print("item is : ",boxes.Class_name)   

def sent_sucker_signal(signal):  #let sucker enable or disable (input is on or off) 
    pub = rospy.Publisher("raspberry_sent", String, queue_size=10)
    rate = rospy.Rate(10) # 10hz
    rospy.loginfo(signal)
    pub.publish(signal)
    rate.sleep()    

def test_arduino_func():  #test pressure
    global pressure_info,action,Arm_state_flag,Sent_data_flag,down_stop_flag
    if Arm_state_flag == Arm_status.Idle and Sent_data_flag == 1:
        Sent_data_flag = 0
        Arm_state_flag = Arm_status.Isbusy

        for case in switch(action): #傳送指令給socket選擇手臂動作
            if case(0):      #Arm to BOX above
                print("---Arm left---")
                pos.x = 15
                pos.y = 45.5
                pos.z = 1.35
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                action = 1
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                ArmTask.Speed_Mode(1)
                ArmTask.Arm_Mode(4,1,0,30,2)#action,ra,grip,vel,both

                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,30,2)#action,ra,grip,vel,both
                break


            if case(1):  #catch items in box(down)
                print("---arm right---")
                pos.x = -10
                pos.y = 45.5
                pos.z = 1.35
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                action = 0
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                ArmTask.Speed_Mode(0)
                ArmTask.Arm_Mode(4,1,0,30,2)#action,ra,grip,vel,both

                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,30,2)#action,ra,grip,vel,both
                time.sleep(5) #please delete
                break






def Mission_strategy():
    global action,count_stop,Arm_state_flag,Sent_data_flag,image_point,cntr_point,item_name,get_image_flag,suck_point,change_position
    global final_x,final_y,center_x,center_y,yolo_z,down_stop_flag,diff_item,picture_count,pressure_info,switch_flag

    #print('in top of mission updown ', [Arm_state_flag, Sent_data_flag,Arm_state_flag == Arm_status.Idle and Sent_data_flag == 1])
    # print([Arm_state_flag, Sent_data_flag])
    if Arm_state_flag == Arm_status.Idle and Sent_data_flag == 1:
        Sent_data_flag = 0
        Arm_state_flag = Arm_status.Isbusy

        for case in switch(action): #傳送指令給socket選擇手臂動作
            if case(0):      #Arm to BOX above
                print("---Arm to BOX above---")
                label.metal = 0
                label.bottle = 0
                label.paper = 0

                pos.x = 1.5
                pos.y = 45.5
                pos.z = star_config.yolo_z
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                action = 1
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)

                ArmTask.Speed_Mode(1)
                ArmTask.Arm_Mode(4,1,0,30,2) #speed up

                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,100,2)#action,ra,grip,vel,both
                break

            if case(1):   #get_obj_coordinate & in postition
                print("---get item information & ready to catch---")
                time.sleep(0.75)
                switch_flag = 0
                get_image_flag = 1   #let yolo identify item
                time.sleep(0.5)
                get_image_flag = 0   

                realsense_look()
#                show_orientation()

                pos.x = pos.x
                pos.y = pos.y 
                pos.z = -2.35
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                sent_sucker_signal("on")
                action = 2
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,100,2)#action,ra,grip,vel,both                
                break

            if case(2):  #catch items in box
                print("---catch item stage 1---")
                sent_sucker_signal("on")
                pos.x = cntr_point.center_point_x
                pos.y = cntr_point.center_point_y
                pos.z = -2.65 
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                action = 12   
                if cntr_point.center_point_y  < 51:
                    if cntr_point.center_point_x > 1.5:
                        pos.yaw = -90
                    elif cntr_point.center_point_x < 1.5:   
                        pos.yaw = 90                         
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,100,2)#action,ra,grip,vel,both
                break

            if case(3):  #down & suck the item
                pos.x = pos.x
                pos.y = pos.y
                pos.z = pos.z - 0.4
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = pos.yaw

                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,100,2)#action,ra,grip,vel,both
#                arduino_sucker_info()   
                if pos.z <= -26.35 or down_stop_flag == 0: # -13.45
                    print("---catch item stage 3---")
                    action = 4
                    print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                break

            if case(4):   #arm up
                #time.sleep(0.5)
                print("---Arm up---")
                pos.x = pos.x
                pos.y = pos.y
                pos.z = 0
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = pos.yaw
                action = 5
                if down_stop_flag == 1:
                    action = 0
                # if suck_point < 4:
                #     suck_point = suck_point +1
                # else:
                #     suck_point = 0
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)

                ArmTask.Speed_Mode(0)
                ArmTask.Arm_Mode(4,1,0,30,2) #speed down

                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,100,2)#action,ra,grip,vel,both

                #========================new function======================================#
                if boxes.Class_name == "bottle":
                    diff_item = 0
                    action = 7
                elif boxes.Class_name == "paper":
                    diff_item = 1
                    action = 7
                elif boxes.Class_name == "metal":
                    diff_item = 2
                    action = 7
                else:
                    diff_item = 0
                    action = 7
                    print("cant see anything")


                break

            if case(5):   #move to camera sight
                print("---move to camera sight---")
                pos.x = -13
                pos.y = 55
                pos.z = 1.35
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                action = 6
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)

                ArmTask.Speed_Mode(1)
                ArmTask.Arm_Mode(4,1,0,10,2) #speed up

                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,50,2)#action,ra,grip,vel,both
                time.sleep(1)   #please delete
                break

            if case(6): #analyst item & pos
                print("---analyst item---")
                time.sleep(1)
                action = 10
                yolo_receive()

                if boxes.Class_name == "metal":
                    label.metal = label.metal+1
                elif boxes.Class_name == "bottle":
                    label.bottle = label.bottle+1
                elif boxes.Class_name == "paper":
                    label.paper = label.paper+1



                if label.metal == 2 or label.bottle == 2 or label.metal == 2: #if first two times is the same then direct identify item
                    identify_item()
                    action = 7

                    pos.x = -13
                    pos.y = 55
                    pos.z = 1.35
                    pos.pitch = -90
                    pos.roll = 0
                    pos.yaw = 0
                    ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                    ArmTask.Arm_Mode(2,1,0,60,2)#action,ra,grip,vel,both

                elif picture_count >= 2:    #maybe can delete?
                    identify_item()
                    action = 7

                    pos.x = -13
                    pos.y = 55
                    pos.z = 1.35
                    pos.pitch = -90
                    pos.roll = 0
                    pos.yaw = 0
                    ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                    ArmTask.Arm_Mode(2,1,0,60,2)#action,ra,grip,vel,both
                picture_count = picture_count +1
                break

            if case(7): #select final point
                print("---select final point---") 
                picture_count = 0
                if diff_item == 0:  #bottle
                    final_x = 1.5
                    final_y = 35.5
                    print("Its bottle!")
                    action = 8

                elif diff_item == 1: #paper
                    final_x = 33
                    final_y = 43.5
                    print("Its paper!")
                    action = 8
                
                elif diff_item == 2: #metal
                    final_x = -24
                    final_y = 43.5
                    print("Its metal!")
                    action = 8

                elif diff_item == 3:
                    action = 10
                    print("cant identify item!")

                else:
                    print("unkown item")
                break

            if case(8): #move to final point 
                print("---move to final point---")
                pos.x = final_x
                pos.y = final_y
                pos.z = star_config.yolo_z
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = pos.yaw
                action = 9
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)

                ArmTask.Speed_Mode(1)
                ArmTask.Arm_Mode(4,1,0,30,2) #speed up

                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,60,2)#action,ra,grip,vel,both
                break

            if case(9): #drop item to container & recycle
                print("---drop item to container---")
                if down_stop_flag == 0:
                    count_stop = count_stop + 1
                time.sleep(0.75)
                action = 0
                sent_sucker_signal("off")
                suck_point = 0
                change_position = 0
                print("round: ",count_stop)
                break
#===============================================================================#

            if case(10):   #use when second camera get
                print("---spin the item---")
                pos.x = -13
                pos.y = 55
                pos.z = 1.35
                pos.pitch = -90
                pos.roll = 0    
                pos.yaw = pos.yaw +30
                action = 6
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,100,2)#action,ra,grip,vel,both
                break

            if case(11):   #ensure realsense not to look for same point
                print("---change realsense position---")
                if suck_point == 1:               #realsense to front
                    pos.x = 1.5
                    pos.y = 48.5
                    pos.z = star_config.yolo_z
                elif suck_point == 2:             #realsense to rear
                    pos.x = 1.5
                    pos.y = 42.5
                    pos.z = star_config.yolo_z
                elif suck_point == 3:             #realsense to front(down)
                    pos.x = 1.5
                    pos.y = 45.5
                    pos.z = -4.65
                elif suck_point == 4:             #realsense to rear(down)
                    pos.x = 1.5
                    pos.y = 42.5
                    pos.z = -4.65
                else:                             #realsense to original position
                    pos.x = 1.5
                    pos.y = 45.5
                    pos.z = star_config.yolo_z    

                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,60,2)#action,ra,grip,vel,both
                action = 1

            if case(12):  #catch items in box(down)
                print("---catch item stage 2---")
                pos.x = cntr_point.center_point_x
                pos.y = cntr_point.center_point_y
                pos.z = cntr_point.z_depth
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = pos.yaw
                action = 3           
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                ArmTask.point_data(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.Arm_Mode(2,1,0,80,2)#action,ra,grip,vel,both
                break
                
            if case(): # default, could also just omit condition or 'if True'
                rospy.on_shutdown(myhook)
                ArmTask.rospy.on_shutdown(myhook)


    #action: ptp line
    #ra : abs rel
    #grip 夾爪
    #vel speed
    #both : Ctrl_Mode
##-------------strategy end ------------
def myhook():
    print ("shutdown time!")

if __name__ == '__main__':
    argv = rospy.myargv()
    rospy.init_node('strategy', anonymous=True)
    GetInfoFlag = True #Test no data
    arm_state_listener()
    selective_search = rospy.ServiceProxy('Selective_Search', Selective_Search_srv)
    rospy.Subscriber("raspberry_receive",String,callback_receive_sucker)
    rospy.Subscriber("/darknet_ros/bounding_boxes",BoundingBoxes,Yolo_callback)
    rospy.Subscriber("/object/pose",PoseStamped,normal_callback)
    rospy.Subscriber("/camera/aligned_depth_to_color/image_raw",Image,Get_image.depth_callback) 
    start_input = int(input('開始策略請按1,離開請按3 : ')) #輸入開始指令
    #start_input = 1
    if start_input==1:
        while 1:
            time.sleep(0.05) #0710 最穩定 delay 0.1秒
            Mission_strategy()
            if count_stop == 6:
                print(" Done! you can press the buttom~")
    if start_input == 2:
        while 1:
            time.sleep(0.2)
            test_arduino_func()

    if start_input == 3:
        pass
    #timer.join()
    ArmTask.rospy.spin()
    rospy.spin()
