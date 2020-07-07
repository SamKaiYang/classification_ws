#!/usr/bin/env python3
# license removed for brevity
#策略 機械手臂 四點來回跑
import sys
sys.path.insert(1, "/home/luca/.local/lib/python3.5/site-packages/")
sys.path.insert(0, '/opt/installer/open_cv/cv_bridge/lib/python3/dist-packages/')

import threading
import time
import rospy
import os
import numpy as np
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point
from geometry_msgs.msg import PoseStamped

import cv2
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String
from ROS_Socket.srv import *
from getcalue.srv import *
from zed_image_process.srv import *
from ROS_Socket.msg import *
import math
import enum
import Hiwin_RT605_Arm_Command as ArmTask 
##----------rqt------------
from dynamic_reconfigure.server import Server
from ROS_Socket.cfg import TutorialsConfig
##----Arm state-----------
Arm_state_flag = 0
Strategy_flag = 0
Sent_data_flag = True
##----Arm status enum
class Arm_status(enum.IntEnum):
    Idle = 0
    Isbusy = 1
    Error = 2
    shutdown = 6
##-----------server feedback arm state----------
def Arm_state(req):
    global CurrentMissionType,Strategy_flag,Arm_state_flag
    Arm_state_flag = int('%s'%req.Arm_state)
    if Arm_state_flag  == Arm_status.Isbusy: #表示手臂忙碌
        Strategy_flag = False
        return(1)
    if Arm_state_flag  == Arm_status.Idle: #表示手臂準備
        Strategy_flag = True
        return(0)
    if Arm_state_flag  == Arm_status.shutdown: #表示程式中斷
        Strategy_flag = 6
        return(6)
##-----------server feedback Sent_flag----------
def Sent_flag(req):
    global Sent_data_flag
    Sent_data_flag = int('%s'%req.sent_flag)
    return(1)
def arm_state_server():
    #rospy.init_node(NAME)
    s = rospy.Service('arm_state',arm_state, Arm_state) ##server arm state
    a = rospy.Service('sent_flag',sent_flag,Sent_flag)
    #rospy.spin() ## spin one
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
    def __init__(self,label,x_max,x_min,y_max,y_min,down_z):
        self.label = label
        self.x_max = x_max
        self.x_min = x_min
        self.y_max = y_max
        self.y_min = y_min
        self.down_z = down_z
image_point = get_point('',0,0,0,0,5)

class get_center_point():
    def __init__(self,center_point_x,center_point_y,z_depth):
        self.center_point_x = center_point_x
        self.center_point_y = center_point_y 
        self.z_depth = z_depth

cntr_point = get_center_point(0,0,0)

class get_real():
    def __init__(self,roll,pitch,yaw):
        self.roll = roll
        self.pitch = pitch
        self.yaw = yaw
realsense_point = get_real(0,0,0)

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
star_config = star_cfg(4.35,0)
##-------------------------strategy---------------------
action = 0
test_list = []
center_point_x = 0
center_point_y = 0
center_x = 401
center_y = 1234

final_point_x = 0
final_point_y = 0
pressure_info = ""
item = ""

Depth_Bridge = CvBridge()
Depth_Image =  np.zeros((720,1280,1), np.float32)

switch_flag = 0

def Mission_Trigger():
    global action,Arm_state_flag,Sent_data_flag
    if Arm_state_flag == Arm_status.Idle and Sent_data_flag == 1:
        Sent_data_flag = 0
        Arm_state_flag = Arm_status.Isbusy
        for case in switch(action): #傳送指令給socket選擇手臂動作
            if case(0):
                pos.x = 10
                pos.y = 36.8
                pos.z = 11.35
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                action = 1
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                #ArmTask.strategy_client_Arm_Mode(2,1,0,10,2)#action,ra,grip,vel,both
                ArmTask.strategy_client_pos_move(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.strategy_client_Arm_Mode(2,1,0,10,2)#action,ra,grip,vel,both
                break
            if case(1):
                pos.x = 10
                pos.y = 42
                pos.z = 11.35
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                action = 2
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                #ArmTask.strategy_client_Arm_Mode(2,1,0,10,2)#action,ra,grip,vel,both
                ArmTask.strategy_client_pos_move(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.strategy_client_Arm_Mode(2,1,0,10,2)#action,ra,grip,vel,both
                break
            if case(2):
                pos.x = -10
                pos.y = 42
                pos.z = 11.35
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                action = 3
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                #ArmTask.strategy_client_Arm_Mode(2,1,0,10,2)#action,ra,grip,vel,both
                ArmTask.strategy_client_pos_move(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.strategy_client_Arm_Mode(2,1,0,10,2)#action,ra,grip,vel,both
                break
            if case(3):
                pos.x = -10
                pos.y = 36.8
                pos.z = 11.35
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                action = 4
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                #ArmTask.strategy_client_Arm_Mode(2,1,0,10,2)#action,ra,grip,vel,both
                ArmTask.strategy_client_pos_move(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.strategy_client_Arm_Mode(2,1,0,10,2)#action,ra,grip,vel,both
                break
            if case(4):
                pos.x = 0
                pos.y = 36.8
                pos.z = 11.35
                pos.pitch = -90
                pos.roll = 0
                pos.yaw = 0
                action = 0
                print('x: ',pos.x,' y: ',pos.y,' z: ',pos.z,' pitch: ',pos.pitch,' roll: ',pos.roll,' yaw: ',pos.yaw)
                #ArmTask.strategy_client_Arm_Mode(2,1,0,10,2)#action,ra,grip,vel,both
                ArmTask.strategy_client_pos_move(pos.x,pos.y,pos.z,pos.pitch,pos.roll,pos.yaw)
                ArmTask.strategy_client_Arm_Mode(2,1,0,10,2)#action,ra,grip,vel,both
                break
            if case(): # default, could also just omit condition or 'if True'
                rospy.on_shutdown(myhook)
                ArmTask.rospy.on_shutdown(myhook)


def callback_yolo_receive(data):
    global item
    item = data.data

def yolo_receive():
    global item
    print("item is : ",item)
    print("================================================")

def callback_arduino_info(data):
    global pressure_info
    pressure_info = data.data

def arduino_sucker_info():
    global pressure_info
    print(pressure_info)
    print("================================================")

def realsense_look():
#     ans = int(input("input is(1) : "))
#     if(ans == 1):
# #        x, y, w, h, depth = call_selective_search(1)
#         x, y, w, h, depth = call_get_point(1)
#         print("x, y, w, h, depth", x, y, w, h, depth)
#         print("center_point_x : ",0.05326*(x+w/2) - 16.61)
#         print("center_point_y : ",-0.04601*(y+h/2) + 66.34)
#         if depth > 0.28 and depth <= 0.342:
#             depth = 17
#         elif depth > 0.342:
#             depth = 24.5
#         print("depth : ",depth)
#         print("===========================================")
#     else:
#         pass
# #    rospy.Subscriber("/object/pose_rpy",PoseStamped,callback_realsense)
    global switch_flag
    x, y, w, h, depth = 0.0,0.0,0.0,0.0,0.0
    if switch_flag == 1:
        while(x == 0.0 and y == 0.0):
    #        x, y, w, h, depth = call_selective_search(1) for realsense
            x, y, w, h, depth = call_get_point(1)    #for zed
        print("x, y, w, h, depth", x, y, w, h, depth)
        cntr_point.center_point_x = x+w/2
        cntr_point.center_point_y = y+h/2
        cntr_point.z_depth = depth   
        print("==== USE ZED ====") 

    cntr_point.center_point_x = 0.05783*cntr_point.center_point_x - 32.78
    cntr_point.center_point_y = -0.05872*cntr_point.center_point_y + 76.53
    #eliminate the bias when realsense change its position

    print("center_point_x : ",cntr_point.center_point_x)
    print("center_point_y : ",cntr_point.center_point_y)
    print("depth : ",cntr_point.z_depth)
    print("===========================================")

def call_selective_search(input_key):     #for realsense use
    global resp1
    try:
        pub_Max = rospy.Publisher('/coordinate_limit_Max', Point, queue_size=10)
        pub_Min = rospy.Publisher('/coordinate_limit_min', Point, queue_size=10)

        rospy.wait_for_service('Selective_Search')
        resp1 = selective_search(input_key)
        # when depth =  0.48
    
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

def call_get_point(input_key):     #for zed use
    try:
        rospy.wait_for_service('Zed_Get_Point')

        pub_Max = rospy.Publisher('/coordinate_limit_Max', Point, queue_size=10)
        pub_Min = rospy.Publisher('/coordinate_limit_min', Point, queue_size=10)

        resp = Get_Point(input_key)

        # when depth = 30
        #  
        # 21.8174242 pixel = 1 cm = 0.01 M

        # when depth = 32.5
        #
        # 20.7 pixel = 1 cm = 0.01 M

        # when depth = 45.7
        #  
        # 14.8 pixel = 1 cm = 0.01 M

        # 0.4469697 d_pixel = 1 d_cm depth


        #====== test ========
        # resp.x = 530
        # resp.y = 310
        # resp.depth = 0.35
        #====================
        depth_base = 0.3
        M2cm = 100

        LeftCamera2ImageCcenter_x = 3 # cm
        LeftCamera2ImageCcenter_y = -3 # cm

        pixel2cm = ( 1 / (21.8174242 - (resp.depth - depth_base) * M2cm * 0.4469697) )

        PointCloud_x_Max = ((((resp.x + 0.5*resp.w) - 640) * pixel2cm ) + LeftCamera2ImageCcenter_x ) / M2cm
        PointCloud_x_min = ((((resp.x - 0.5*resp.w) - 640) * pixel2cm ) + LeftCamera2ImageCcenter_x ) / M2cm
        PointCloud_y_Max = ((((resp.y + 0.5*resp.h) - 320) * pixel2cm ) + LeftCamera2ImageCcenter_y ) / M2cm
        PointCloud_y_min = ((((resp.y - 0.5*resp.h) - 320) * pixel2cm ) + LeftCamera2ImageCcenter_y ) / M2cm
        print("PointCloud_x_Max, PointCloud_x_min", PointCloud_x_Max, PointCloud_x_min)
        print("PointCloud_y_Max, PointCloud_y_min", PointCloud_y_Max, PointCloud_y_min)

        depth_limit_Max = 0.6
        depth_limit_min = 0.3
        
        while 1 :
            if pub_Max.get_num_connections() > 0 and pub_Min.get_num_connections() > 0:
                pub_Max.publish(PointCloud_x_Max,PointCloud_y_Max,depth_limit_Max)
                pub_Min.publish(PointCloud_x_min,PointCloud_y_min,depth_limit_min)
                break
        return resp.x, resp.y, resp.w, resp.h, resp.depth

    except rospy.ServiceException:
        print("Service call failed")
        resp1.x , resp1.y, resp1.w, resp1.h, resp1.depth = 0.0, 0.0, 0.0, 0.0, 0.0
        return resp1.x , resp1.y, resp1.w, resp1.h, resp1.depth






def callback_realsense(aa):
#    global realsense_point
    realsense_point.roll = aa.pose.orientation.x -90 -73
    realsense_point.pitch = aa.pose.orientation.y -180 +1
    realsense_point.yaw = aa.pose.orientation.z -90 -73

def show_orientation():
    print("roll is : ",realsense_point.roll)
    print("pitch is : ",realsense_point.pitch)
    print("yaw is : ",realsense_point.yaw)
    print("==========================================================================")
    time.sleep(2)

def depth_callback(depth_data):
    global  Depth_Image
    Depth_Image = Depth_Bridge.imgmsg_to_cv2(depth_data, "32FC1")
    Depth_Image = np.array(Depth_Image, dtype=np.float32)    

def callback_raspberry_info(data):
    global pressure_info
    pressure_info = data.data

def raspberry_info():
    global pressure_info
    print("data is: ",pressure_info)
    print("==============================================")

def Mission_raspberry():
    pub = rospy.Publisher('raspberry_sent', String, queue_size=10)
    rate = rospy.Rate(10) # 10hz
#    while not rospy.is_shutdown():
    data = input(str('input is("on" or "off") : '))
    rospy.loginfo(data)
    pub.publish(data)
    rate.sleep()    

def Mission_arduino():
    pub = rospy.Publisher('arduino_sent', String, queue_size=10)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        data = input(str('input is(y or n) : '))
        rospy.loginfo(data)
        pub.publish(data)
        rate.sleep()

def Mission_Test():
    rospy.Subscriber("yolo_image",String,callback_yolo)
#    rospy.Subscriber("/object/ROI_array",ROI_array,callback_point)
    print("==========================================================================")

def yolo_Callback(data):
    global switch_flag, Depth_Image
    my_data = data
    if len((my_data.ROI_list)) == 0:
#        print("No Object Found!")
        switch_flag = 1
    else:
        image_point.label =  my_data.ROI_list[0].object_name
        image_point.x_max = my_data.ROI_list[0].Max_x
        image_point.x_min = my_data.ROI_list[0].min_x
        image_point.y_max = my_data.ROI_list[0].Max_y
        image_point.y_min = my_data.ROI_list[0].min_y
        center_x, center_y = ((my_data.ROI_list[0].Max_x - my_data.ROI_list[0].min_x)/2) + my_data.ROI_list[0].min_x, ((my_data.ROI_list[0].Max_y - my_data.ROI_list[0].min_y)/2) + my_data.ROI_list[0].min_y
        cntr_point.center_point_x = center_x
        cntr_point.center_point_y = center_y
        show_depth_image = Depth_Image
        center_depth = show_depth_image[int(center_y)][int(center_x)]
#        print('center_depth = ', center_depth)
        cntr_point.z_depth = center_depth        


def callback_yolo(aa):
    item_name = aa.data
    print("the item is: ",item_name)

def callback_point(aa):
    global test_list,image_point,center_point_x,center_point_y
    global center_x,center_y,final_point_x,final_point_y
    test_list = aa

    for obj_num in range(len(aa.ROI_list)):
        image_point.label = aa.ROI_list[0].object_name
        image_point.x_max = aa.ROI_list[0].Max_x
        image_point.x_min = aa.ROI_list[0].min_x 
        image_point.y_max = aa.ROI_list[0].Max_y 
        image_point.y_min = aa.ROI_list[0].min_y 

        center_point_x = (image_point.x_max + image_point.x_min)*0.5 
        center_point_y = (image_point.y_max + image_point.y_min)*0.5 

        final_point_x = 0.05464*center_point_x -17.15
        final_point_y = -0.05775*center_point_y  +69.44

        print("center_point_x: ",center_point_x)
        print("center_point_y: ",center_point_y)
        print("===========================================")
        print("Arm X need to move: ",final_point_x)
        print("Arm Y need to move: ",final_point_y)
        print("===========================================")




    if test_list != None:
        print(test_list)
        print("======================")
        print(image_point.label)
        print("X_max: ",image_point.x_max)
        print("X_min: ",image_point.x_min)
        print("center_X: ",center_point_x)
        print("center_y: ",center_point_y)
        print("======================")

        if image_point.label == "tap":
            print("Is a tap")
            print("==================")
        if image_point.label == "cloth":
            print("Is a cloth")
            print("==================")           
        if image_point.label == "blueball":
            print("Is a buleball")
            print("==================")

#        print("X_coordinate: max,min: ",image_point.x_max,image_point.x_min)
#        print("Y_coordinate: max,min: ",image_point.y_max,image_point.y_min)


    #action: ptp line
    #ra : abs rel
    #grip 夾爪
    #vel speed
    #both : Ctrl_Mode
##-------------strategy end ------------
def myhook():
    print ("shutdown time!")

def rqt_callback(config, level):
    # rospy.loginfo("""Reconfigure Request: {int_param}, {double_param},\
    #       {str_param}, {bool_param}, {size}""".format(**config))
    rospy.loginfo("""Reconfigure Request: {yolo_z}, {down_z}""".format(**config))
    yolo_z = config.yolo_z
    down_z = config.down_z
    return config    

if __name__ == '__main__':
    argv = rospy.myargv()
    rospy.init_node('strategy', anonymous=True)
    srv = Server(TutorialsConfig, rqt_callback)
    GetInfoFlag = True #Test no data
    arm_state_server()
    selective_search = rospy.ServiceProxy('Selective_Search', Selective_Search_srv)
    Get_Point = rospy.ServiceProxy('Zed_Get_Point', Get_Point_srv)
    rospy.Subscriber("arduino_receive",String,callback_arduino_info)
    rospy.Subscriber("listener",String,callback_raspberry_info)
    rospy.Subscriber("yolo_sent",String,callback_yolo_receive)
    rospy.Subscriber("/object/pose_rpy",PoseStamped,callback_realsense)
    rospy.Subscriber("/object/ROI_array", ROI_array, yolo_Callback)
    rospy.Subscriber("/zed/zed_node/depth/depth_registered", Image,depth_callback)
    start_input=int(input('開始策略請按1,離開請按3 : ')) #輸入開始指令
    start_input = 1
    if start_input==1:
        while 1:
            time.sleep(0.3) #0627 最穩定 delay 0.3秒
            switch_flag = 0
            change_input=int(input('1:realsense,2:orientation,3:sucker,4:presure_value,5:image ,6:speedup ')) #輸入開始指令
            if change_input == 1:
                realsense_look()
            elif change_input == 2:
                show_orientation()
            elif change_input == 3:
                Mission_raspberry()
            elif change_input == 4:
                raspberry_info()
            elif change_input == 5:
                yolo_receive()
            else:
                pass
            time.sleep(2)
    if start_input == 3:
        pass
    #timer.join()
    ArmTask.rospy.spin()
    rospy.spin()
