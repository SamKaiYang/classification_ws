#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
sys.path.insert(1, "/home/luca/.local/lib/python3.5/site-packages/")
sys.path.insert(0, "/opt/installer/open_cv/cv_bridge/lib/python3/dist-packages/")
import cv2

import numpy as np
ph1 = "/home/luca/Documents/realsense_ws/src/getcalue/src/Image_1.png"
ph2 = "/home/luca/Documents/realsense_ws/src/getcalue/src/Image_2.png"

threshod= 20 

img = cv2.imread(ph2,3)
s1 = cv2.imread(ph1,0)
s2 = cv2.imread(ph2,0)

emptyimg = np.zeros(s1.shape,np.uint8)
#fgbg = cv2.BackgroundSubtractorMOG()

def pic_sub(dest,s1,s2,img):
    for x in range(dest.shape[0]):
        for y in range(dest.shape[1]):
            if(s2[x,y] > s1[x,y]):
                dest[x,y] = s2[x,y] - s1[x,y]
            else:
                dest[x,y] = s1[x,y] - s2[x,y]

            if(dest[x,y] < threshod):
                img[x,y] = 255
                dest[x,y] = 0
            else:
                dest[x,y] = 255

pic_sub(emptyimg,s1,s2,img)

# cv2.namedWindow("s1")
# cv2.namedWindow("s2")
cv2.namedWindow("result")
# cv2.namedWindow("img")

# cv2.imshow("s1",s1)
# cv2.imshow("s2",s2)
cv2.imshow("result",emptyimg)
# cv2.imshow("img",img)

cv2.waitKey(0)
cv2.destroyAllWindows()