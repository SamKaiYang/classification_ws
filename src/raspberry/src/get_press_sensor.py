#!/usr/bin/env python3
# license removed for brevity
import rospy
from std_msgs.msg import String
from time import sleep
import socket

#HOST = '169.254.192.38'
HOST = '10.42.0.65'
PORT = 8000

s = socket.socket()
s.connect((HOST, PORT))

def talker():
    data=0
    pub = rospy.Publisher('raspberry_receive', String, queue_size=10)
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():

        data = s.recv(1024).decode()
        print (data)
        print('接收到的資料：', data)

        data=str(data)
        rospy.loginfo(data)
        pub.publish(data)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
