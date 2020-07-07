#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
import socket
from time import sleep

 
#COM_PORT = '/dev/ttyACM0'  # 請自行修改序列埠名稱
#BAUD_RATES = 9600
#ser = serial.Serial(COM_PORT, BAUD_RATES)

#HOST = '169.254.192.38'
HOST = '10.42.0.65'
PORT = 4041
s = socket.socket()
s.connect((HOST, PORT))
def callback(data):
    s.sendall(data.data.encode())
    feedback = s.recv(1024).decode()
    print (feedback)
        
    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("raspberry_sent", String, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    
    listener()
