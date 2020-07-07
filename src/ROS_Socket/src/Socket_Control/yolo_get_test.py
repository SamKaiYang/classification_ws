#!/usr/bin/env python3
import sys
sys.path.insert(1, "/home/iclab/.local/lib/python3.6/site-packages/")
sys.path.insert(0, '/opt/installer/open_cv/cv_bridge/lib/python3/dist-packages/')
import rospy
import os
import threading
import numpy as np
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point
from geometry_msgs.msg import PoseStamped
from cv_bridge import CvBridge, CvBridgeError
import math
import enum
from darknet_ros_msgs.msg import BoundingBox
from darknet_ros_msgs.msg import BoundingBoxes
import time
from ROS_Socket.srv import *
#from getcalue.srv import *
import cv2
from ROS_Socket.msg import *
#import Hiwin_RT605_Socket as ArmTask
from std_msgs.msg import String
from std_msgs.msg import Int32MultiArray
from get_rs_image import Get_image
from get_rs_image.srv import *
#quaternion use
from autolab_core import RigidTransform

obj_num = 0
Depth_Bridge = CvBridge()
global Depth_Image
Depth_Image =  np.zeros((720,1280,1), np.float32)
#point_a_world = [0,0,0]
# class vision_point():
#     def __init__(self,x,y,z):
#         self.x = x
#         self.y = y
#         self.z = z
# v_pos = vision_point(0,0.08,0.01135)
v_pos = Point()
v_pos.x = 0.003
v_pos.y = 0.001
v_pos.z = 0.002
magic_num = Point()
magic_num.x = 0.035
magic_num.y = 0.035
magic_num.z = 0.035

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
# YOLO V4 輸入
def Yolo_callback(data):
    global obj_num
    #global probability,xmin,ymin,xmax,ymax,id_name,Class_name
    obj_num = len((data.bounding_boxes))
    if obj_num == 0:
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

class coordinate_normal():
    def __init__(self,x,y,z,normal_x,normal_y,normal_z,normal_w):
        self.x = x
        self.y = y
        self.z = z
        self.normal_x = normal_x
        self.normal_y = normal_y
        self.normal_z = normal_z
        self.normal_w = normal_w
normal = coordinate_normal(0,0,0,0,0,0,0)
#物件法向量 四元數
def normal_callback(data):
    global count_stop,get_image_flag,switch_flag,Depth_Image
    normal.x = data.pose.position.x
    normal.y = data.pose.position.y
    normal.z = data.pose.position.z
    normal.normal_x = data.pose.orientation.x
    normal.normal_y = data.pose.orientation.y
    normal.normal_z = data.pose.orientation.z
    normal.normal_w = data.pose.orientation.w
#realsense 影像中物件座標 轉換成手臂座標
def camera_point(data): #get coordinate of what camera first see #===  use only object_name for now ===#
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

#提取深度資訊callback
def depth_callback(depth_data):
    global Depth_Image
    DI = Depth_Bridge.imgmsg_to_cv2(depth_data, "16UC1")
    Depth_Image = np.array(DI, dtype=np.float32)

def quaternion_to_rotation(point):
    print(v_pos)
    point_a_world_max = calculate_max(point)
    point_a_world_min = calculate_min(point)
    #point_a_world_max = calculate_max(point)
    
    pub_max.publish(point_a_world_max)
    pub_min.publish(point_a_world_min)
    rate.sleep()
    if normal.normal_w==0 and normal.normal_x==0 and normal.normal_y==0 and normal.normal_z==0 :
        pass
    else:
        rotation_quaternion = np.asarray([normal.normal_w, normal.normal_x, normal.normal_y, normal.normal_z])
        translation = np.asarray([normal.x, normal.y, normal.z])
        # 这里用的是UC Berkeley的autolab_core，比较方便吧，当然可以自己写一个fuction来计算，计算公式在https://www.cnblogs.com/flyinggod/p/8144100.html
        T_qua2rota = RigidTransform(rotation_quaternion, translation)
        #print(T_qua2rota.rotation)

        # # Test 
        # # 寫上用四元數表示的orientation和xyz表示的position
        # orientation = {'y': -0.6971278819736084, 'x': -0.716556549511624, 'z': -0.010016582945017661, 'w': 0.02142651612120239}
        # position = {'y': -0.26022684372145516, 'x': 0.6453529828252734, 'z': 1.179122068068349}
        # rotation_quaternion = np.asarray([orientation['w'], orientation['x'], orientation['y'], orientation['z']])
        # translation = np.asarray([position['x'], position['y'], position['z']])
        # # 這裡用的是UC Berkeley的autolab_core，比較方便吧，當然可以自己写一个fuction来计算，计算公式在https://www.cnblogs.com/flyinggod/p/8144100.html
        # T_qua2rota = RigidTransform(rotation_quaternion, translation)
        # #T_qua2rota.rotation
        # print(T_qua2rota.rotation)
def calculate_min(point_min):
    pos_min = Point()
    pos_min.x = point_min.x - magic_num.x
    pos_min.y = point_min.y - magic_num.y
    pos_min.z = point_min.z - magic_num.z
    print(pos_min)
    return pos_min

def calculate_max(point_max):
    pos_max = Point()
    pos_max.x = point_max.x + magic_num.x
    pos_max.y = point_max.y + magic_num.y
    pos_max.z = point_max.z + magic_num.z
    print(pos_max)
    return pos_max
if __name__ == '__main__':

    argv = rospy.myargv()
    pub_min = rospy.Publisher("/coordinate_limit_min",Point,queue_size=20)
    pub_max = rospy.Publisher("/coordinate_limit_max",Point,queue_size=20)

    rospy.init_node('strategy', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    rospy.Subscriber("/darknet_ros/bounding_boxes",BoundingBoxes,Yolo_callback)
    rospy.Subscriber("/object/pose",PoseStamped,normal_callback)
    rospy.Subscriber("/camera/aligned_depth_to_color/image_raw",Image,depth_callback)
    
    #rospy.Subscriber("/object/ROI_array",ROI_array,callback_point)
    #rospy.Subscriber("/object/pose_rpy",PoseStamped,callback_realsense)
    while not rospy.is_shutdown():
        # print("ID:",boxes.id_name)
        # print("信心值:",boxes.probability)
        # print("Class:",boxes.Class_name)
        # print("xmin:",boxes.xmin)
        # print("ymin:",boxes.ymin)
        # print("xmnax",boxes.xmax)
        # print("ymax:",boxes.ymax)

        # print("x:",normal.x)
        # print("y:",normal.y)
        # print("z:",normal.z)
        # print("normal_x:",normal.normal_x)
        # print("normal_y:",normal.normal_y)
        # print("normal_z:",normal.normal_z)
        # print("normal_w:",normal.normal_w)


        quaternion_to_rotation(v_pos)

        os.system("clear")
        rate.sleep()
    rospy.spin()