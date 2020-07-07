#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
import serial
from time import sleep

 
COM_PORT = '/dev/ttyACM0'  # 請自行修改序列埠名稱
BAUD_RATES = 9600
ser = serial.Serial(COM_PORT, BAUD_RATES)

def callback(data):
    if data.data=="y":
        print('開始吸取\n')
        ser.write(b'ON\n')  # 訊息必須是位元組類型
        
    elif data.data == 'n':
        print('結束吸取\n')
        ser.write(b'OFF\n')  # 訊息必須是位元組類型
    
        
    
def listener():
    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('arduino_listener', anonymous=True)

    rospy.Subscriber("arduino_sent", String, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
