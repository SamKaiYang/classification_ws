#!/usr/bin/env python3
# coding=utf-8
import sys

sys.path.insert(1, "/usr/local/lib/python3.5/dist-packages/")
sys.path.insert(0, "/opt/installer/open_cv/cv_bridge/lib/python3/dist-packages/")
import rospy
import numpy as np
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point
from getcalue.srv import *
from cv_bridge import CvBridge, CvBridgeError
import cv2
#print("cv2 version: ", cv2.__version__)

def call_selective_search(input_key):
    try:
        pub_Max = rospy.Publisher('/coordinate_limit_Max', Point, queue_size=10)
        pub_Min = rospy.Publisher('/coordinate_limit_min', Point, queue_size=10)

        rospy.wait_for_service('Selective_Search')
        selective_search = rospy.ServiceProxy('Selective_Search', Selective_Search_srv)
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

        while True:
            if pub_Max.get_num_connections() > 0 and pub_Min.get_num_connections() > 0 :
                pub_Max.publish(PointCloud_x_Max,PointCloud_y_Max,depth_limit_Max)
                pub_Min.publish(PointCloud_x_min,PointCloud_y_min,depth_limit_min)

                break
        return resp1.x , resp1.y, resp1.w, resp1.h, resp1.depth

    except (rospy.ServiceException):
        print("Service call failed")

if __name__ == "__main__":
    rospy.init_node('Selective_Search_Node', anonymous=True)
    x, y, w, h, depth = call_selective_search(1)
    print("x, y, w, h, depth", x, y, w, h, depth)
