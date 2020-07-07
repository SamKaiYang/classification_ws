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
x_limit_low = 100
y_limit_high = 380
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
        self.Image =  np.zeros((480,640,3), np.float32)
        self.Selective_Search_Image = np.zeros((20,20,1), np.float32)
        self.Accumulate_Depth_Image = np.zeros((480,640), np.float32)
        self.Average_Count = 0
        self.Average_Depth_Image = np.zeros((480,640), np.float32)
        self.Region_Suction_Image = np.zeros((480,640), np.float32)

        #Selective Search
        self.ss = cv2.ximgproc.segmentation.createSelectiveSearchSegmentation()
        self.numShowRects = 5000
        self.Depth_Image_Tolerance = 25
        self.Depth_Image_Limit_Low = 0.1
        self.Depth_Image_Limit_High = 0.4

        self.ContourArea_min = 750

        self.suction_point_x = 0
        self.suction_point_y = 0
        self.Suction_point_depth = 0

        self.Draw_Targe_Flag = False
    def Do_Average_Depth_Image(self, data):
        self.Accumulate_Depth_Image = self.Accumulate_Depth_Image + data
        self.Average_Count += 1 
        num_of_count = 10
        if self.Average_Count == num_of_count:
            self.Average_Depth_Image = cv2.resize((self.Accumulate_Depth_Image/num_of_count)[70:430, 50:525], (640, 480), interpolation=cv2.INTER_LINEAR)
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
        # cv2.imshow("Depth_Image", self.Depth_Image)
        # cv2.imshow("2D_Image", self.Image)
        # cv2.imshow("Selective_Search_Image", self.Selective_Search_Image)

        show_images = self.Image.copy()
        cv2.imshow("Average_Depth_Image", self.Average_Depth_Image)
        #======================================
        # d_images = self.Average_Depth_Image.copy()*255
        # d_images = d_images.astype(np.uint8)
        # canny = cv2.Canny(d_images, 100, 150)

        rgb_image = show_images
        blurred_frame = cv2.GaussianBlur(rgb_image, (7, 7), 0)
        hsv = cv2.cvtColor(blurred_frame, cv2.COLOR_BGR2HSV)
        hsv = hsv.astype(np.uint8)
        lower_blue = np.array([10, 10, 10])
        upper_blue = np.array([230, 230, 230])
        mask = cv2.inRange(hsv, lower_blue, upper_blue)

        # _, contours , _ = cv2.findContours(canny, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)
        _, contours , _ = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)

        output_point = list()
        max_contour_area = 0
        max_contour_areah_index = 0
        for i, contour in enumerate(contours):
            contour_area = cv2.contourArea(contour)
            # Area must  > 0

            if contour_area > 0 :
                M = cv2.moments(contour)
                # x, y of contour
                avg_x = int(M['m10']/M['m00'])
                avg_y = int(M['m01']/M['m00'])

                if x_limit_low <= avg_x <= x_limit_high and y_limit_low <= avg_y <= y_limit_high \
                        and self.Depth_Image_Limit_Low < self.Average_Depth_Image[avg_y][avg_x] < self.Depth_Image_Limit_High \
                        and self.Depth_Image_Limit_Low < self.Average_Depth_Image[avg_y][avg_x+self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                        and self.Depth_Image_Limit_Low < self.Average_Depth_Image[avg_y][avg_x-self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                        and self.Depth_Image_Limit_Low < self.Average_Depth_Image[avg_y+self.Depth_Image_Tolerance][avg_x] < self.Depth_Image_Limit_High \
                        and self.Depth_Image_Limit_Low < self.Average_Depth_Image[avg_y-self.Depth_Image_Tolerance][avg_x] < self.Depth_Image_Limit_High \
                        and self.Depth_Image_Limit_Low < self.Average_Depth_Image[avg_y-self.Depth_Image_Tolerance][avg_x-self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                        and self.Depth_Image_Limit_Low < self.Average_Depth_Image[avg_y+self.Depth_Image_Tolerance][avg_x+self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                        and self.Depth_Image_Limit_Low < self.Average_Depth_Image[avg_y+self.Depth_Image_Tolerance][avg_x-self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                        and self.Depth_Image_Limit_Low < self.Average_Depth_Image[avg_y-self.Depth_Image_Tolerance][avg_x+self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
                        and contour_area > self.ContourArea_min :
                    depth = self.Average_Depth_Image[avg_y][avg_x]
                    data = [avg_x, avg_y, contour_area, depth]
                    output_point.append(data)
                    cv2.drawContours(show_images, contour, -1, (0, 255, 0), 3)

                    # print("cv2.contourArea(contour):", contour_area)
                    # print("Average_Depth_Image[avg_y][avg_x]:", self.Average_Depth_Image[avg_y][avg_x] )
                    # cv2.circle(show_images, (avg_x, avg_y), 5, (255, 0, 0), 3)

        for i in range(len(output_point)):
            if output_point[i][2] > max_contour_area:
                max_contour_area = output_point[i][2]
                max_contour_areah_index = i

        if len(output_point) != 0:
            self.suction_point_x = output_point[max_contour_areah_index][0]
            self.suction_point_y = output_point[max_contour_areah_index][1]
            self.Suction_point_depth = output_point[max_contour_areah_index][3]

            cv2.circle(show_images, (self.suction_point_x, self.suction_point_y ), 5, (255, 0, 0), 3)

        if self.Draw_Targe_Flag :
            self.Region_Suction_Image = self.Image.copy()
            cv2.circle(self.Region_Suction_Image, (self.suction_point_x, self.suction_point_y ), 5, (255, 0, 0), 3)
            cv2.imshow("Targe", self.Region_Suction_Image)
            self.Draw_Targe_Flag = False

        #======================================
        font                   = cv2.FONT_HERSHEY_SIMPLEX
        bottomLeftCornerOfText = (50,50)
        fontScale              = 0.7
        fontColor              = (0,255,255)
        lineType               = 2

        cv2.putText(show_images, "center point depth: " + str(self.Average_Depth_Image[240][320]), 
            bottomLeftCornerOfText, 
            font, 
            fontScale,
            fontColor,
            lineType)

        cv2.circle(show_images, (320, 240), 5, (0, 255, 255), 3)
        # print("self.Average_Depth_Image[240][320]: ", self.Average_Depth_Image[240][320])
        cv2.rectangle(show_images, (x_limit_low, y_limit_low), (x_limit_high, y_limit_high), (255, 80, 0), 2, cv2.LINE_AA)

        #======================================
        cv2.imshow("2D_Image", show_images)
        #======================================
        cv2.waitKey(1)

    def Handle_Selective_Search(self, input_key):
        Pointcloud_Area_w = 50
        Pointcloud_Area_h = 50
        self.Draw_Targe_Flag = True
        return (self.suction_point_x - Pointcloud_Area_w/2) , (self.suction_point_y - Pointcloud_Area_h/2), Pointcloud_Area_w, Pointcloud_Area_h, self.Suction_point_depth

        # input_image = self.Image
        # self.ss.setBaseImage(input_image)
        # self.ss.switchToSelectiveSearchQuality()
        # self.Selective_Search_Image = input_image.copy()

        # rects = self.ss.process()
        # print("Select area num: ", len(rects))
        # x, y, w, h = 0.0, 0.0, 0.0, 0.0

        # for i, rect in enumerate(rects):
        #     x, y, w, h = rect
        #     center_x = int(x+(0.5*w))
        #     center_y = int(y+(0.5*h))
        #     if w_limit_low <= w <= w_limit_high and h_limit_low <= h <= h_limit_high and \
        #         x_limit_low <= x and x + 0.5*w <= x_limit_high and y_limit_low <= y and y + 0.5*h <= y_limit_high \
        #             and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y][center_x] < self.Depth_Image_Limit_High \
        #             and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y][center_x+self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
        #             and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y][center_x-self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
        #             and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y+self.Depth_Image_Tolerance][center_x] < self.Depth_Image_Limit_High \
        #             and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y-self.Depth_Image_Tolerance][center_x] < self.Depth_Image_Limit_High \
        #             and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y-self.Depth_Image_Tolerance][center_x-self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
        #             and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y+self.Depth_Image_Tolerance][center_x+self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
        #             and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y+self.Depth_Image_Tolerance][center_x-self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High \
        #             and self.Depth_Image_Limit_Low < self.Average_Depth_Image[center_y-self.Depth_Image_Tolerance][center_x+self.Depth_Image_Tolerance] < self.Depth_Image_Limit_High:
        #         if (i < self.numShowRects):
        #             # 以方框標示候選區域
        #             cv2.rectangle(self.Selective_Search_Image, (x, y), (x+w, y+h), (0, 0, 255), 5, cv2.LINE_AA)
        #             cv2.circle(self.Selective_Search_Image, (center_x, center_y), 5, (0, 0, 255), 3)
        #             print("self.Average_Depth_Image[center_y][center_x]: ", self.Average_Depth_Image[center_y][center_x])
        #             depth = self.Average_Depth_Image[center_y][center_x]
        #             return x, y, w, h, depth
        #         else:
        #             break
            # else:
            #     self.numShowRects = self.numShowRects + 1
        # return center_x, center_y, w, h

if __name__ == '__main__':

    realsense = Realsense_Sr300()
    while not rospy.is_shutdown():
        realsense.show_image()

    cv2.destroyAllWindows()
