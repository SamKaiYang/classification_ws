#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys

sys.path.insert(1, "/usr/local/lib/python3.5/dist-packages/")
sys.path.insert(0, "/opt/installer/open_cv/cv_bridge/lib/python3/dist-packages/")
import rospy
import numpy as np
from sensor_msgs.msg import Image
from getcalue.msg import *
from getcalue.srv import *
from cv_bridge import CvBridge, CvBridgeError
import cv2
#print("cv2 version: ", cv2.__version__)


w_limit_high = 80
w_limit_low = 20
h_limit_high = 80
h_limit_low = 20
x_limit_high = 550
x_limit_low = 105
y_limit_high = 360
y_limit_low = 100

class Realsense_Sr300():
    def __init__(self):
        #ROS Initial
        rospy.init_node('Realsense_SR300', anonymous=True)
        rospy.Subscriber("/camera/depth/image_rect_raw", Image, self.depth_callback)
        rospy.Subscriber("/camera/color/image_raw", Image, self.image_callback)
        # self.depth_pub = rospy.Publisher('/Selective_search', Image, queue_size=10)
        self.Server = rospy.Service("Selective_Search", Selective_Search_srv, \
            self.Handle_Selective_Search)

        #CV Bridge Initial
        self.Depth_Bridge = CvBridge()
        self.Depth_Image =  np.zeros((480,640,3), np.float32)
        self.Bridge = CvBridge()
        self.Image =  np.zeros((480,640,1), np.float32)
        self.Selective_Search_Image = np.zeros((20,20,1), np.float32)
        self.Accumulate_Depth_Image = np.zeros((480,640), np.float32)
        self.Average_Count = 0
        self.Average_Depth_Image = np.zeros((480,640), np.float32)

        #Selective Search
        self.ss = cv2.ximgproc.segmentation.createSelectiveSearchSegmentation()
        self.numShowRects = 5000
        self.Depth_Image_Tolerance = 10
        self.Depth_Image_Limit_Low = 0.1
        self.Depth_Image_Limit_High = 0.55

    def Do_Average_Depth_Image(self, data):
        self.Accumulate_Depth_Image = self.Accumulate_Depth_Image + data
        self.Average_Count += 1 
        if self.Average_Count == 10:
            self.Average_Depth_Image = cv2.resize((self.Accumulate_Depth_Image/10)[70:430, 50:525], (640, 480), interpolation=cv2.INTER_LINEAR)
            self.Accumulate_Depth_Image = np.zeros((480,640), np.float32)
            self.Average_Count = 0

    def depth_callback(self, data):
        self.Depth_Image = self.Depth_Bridge.imgmsg_to_cv2(data)
        self.Depth_Image = np.array(self.Depth_Image, dtype=np.float32)
        cv2.normalize(self.Depth_Image, self.Depth_Image, 0, 1, cv2.NORM_MINMAX)
        self.Do_Average_Depth_Image(self.Depth_Image)

    def image_callback(self, data):
        self.Image = self.Bridge.imgmsg_to_cv2(data, "bgr8")

    def show_image(self):
        #Show Image
        #cv2.imshow("Depth_Image", self.Depth_Image)
        cv2.rectangle(self.Image, (x_limit_low, y_limit_low), (x_limit_high, y_limit_high), (0, 255, 0), 2, cv2.LINE_AA)
        cv2.imshow("2D_Image", self.Image)
        cv2.imshow("Selective_Search_Image", self.Selective_Search_Image)
        cv2.imshow("Average_Depth_Image", self.Average_Depth_Image)
        
        # print("self.Average_Depth_Image[240][320]: ", self.Average_Depth_Image[240][320])

        font                   = cv2.FONT_HERSHEY_SIMPLEX
        bottomLeftCornerOfText = (50,50)
        fontScale              = 0.7
        fontColor              = (0,255,255)
        lineType               = 2

        cv2.putText(self.Image, "center point depth: " + str(self.Average_Depth_Image[240][320]), 
            bottomLeftCornerOfText, 
            font, 
            fontScale,
            fontColor,
            lineType)

        cv2.circle(self.Image, (320, 240), 5, (0, 255, 255), 3)

        cv2.waitKey(1)

    def Handle_Selective_Search(self, input_key):
        input_image = self.Image
        self.ss.setBaseImage(input_image)
        self.ss.switchToSelectiveSearchQuality()
        self.Selective_Search_Image = input_image.copy()

        rects = self.ss.process()
        print("Select area num: ", len(rects))
        x, y, w, h = 0.0, 0.0, 0.0, 0.0
        for i, rect in enumerate(rects):
            x, y, w, h = rect
            center_x = int(x+(0.5*w))
            center_y = int(y+(0.5*h))
            if w_limit_low <= w <= w_limit_high and h_limit_low <= h <= h_limit_high and \
                x_limit_low <= x and x + 0.5*w <= x_limit_high and y_limit_low <= y and y + 0.5*h <= y_limit_high \
                    and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y][center_x] < self.Depth_Image_Limit_High \
                    and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y][center_x+self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                    and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y][center_x-self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                    and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y+self.Depth_Image_Tolerance][center_x] < self.Depth_Image_Limit_High \
                    and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y-self.Depth_Image_Tolerance][center_x] < self.Depth_Image_Limit_High \
                    and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y-self.Depth_Image_Tolerance][center_x-self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                    and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y+self.Depth_Image_Tolerance][center_x+self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                    and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y+self.Depth_Image_Tolerance][center_x-self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                    and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y-self.Depth_Image_Tolerance][center_x+self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High:
                if (i < self.numShowRects):
                    # 以方框標示候選區域
                    cv2.rectangle(self.Selective_Search_Image, (x, y), (x+w, y+h), (0, 0, 255), 5, cv2.LINE_AA)
                    cv2.circle(self.Selective_Search_Image, (center_x, center_y), 5, (0, 0, 255), 3)
                    print("self.Average_Depth_Image[center_y][center_x]: ", self.Average_Depth_Image[center_y][center_x])
                    depth = self.Average_Depth_Image[center_y][center_x]
                    return x, y, w, h, depth
                else:
                    break
            # else:
            #     self.numShowRects = self.numShowRects + 1
        # return center_x, center_y, w, h


if __name__ == '__main__':

    realsense = Realsense_Sr300()
    while not rospy.is_shutdown():
        realsense.show_image()

    cv2.destroyAllWindows()
