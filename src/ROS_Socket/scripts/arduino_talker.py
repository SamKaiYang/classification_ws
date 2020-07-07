#!/usr/bin/env python3
# license removed for brevity
import rospy
from std_msgs.msg import String
import serial
from time import sleep

 
COM_PORT = '/dev/ttyACM0'  # 請自行修改序列埠名稱
BAUD_RATES = 9600
ser = serial.Serial(COM_PORT, BAUD_RATES)

def talker():
    data=0
    pub = rospy.Publisher('arduino_receive', String, queue_size=10)
    rospy.init_node('arduino_talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        
        while ser.in_waiting:          # 若收到序列資料…
            data_raw = ser.readline()  # 讀取一行
            data = data_raw.decode()   # 用預設的UTF-8解碼
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
