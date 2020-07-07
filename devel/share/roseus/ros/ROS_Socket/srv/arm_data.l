;; Auto-generated. Do not edit!


(when (boundp 'ROS_Socket::arm_data)
  (if (not (find-package "ROS_SOCKET"))
    (make-package "ROS_SOCKET"))
  (shadow 'arm_data (find-package "ROS_SOCKET")))
(unless (find-package "ROS_SOCKET::ARM_DATA")
  (make-package "ROS_SOCKET::ARM_DATA"))
(unless (find-package "ROS_SOCKET::ARM_DATAREQUEST")
  (make-package "ROS_SOCKET::ARM_DATAREQUEST"))
(unless (find-package "ROS_SOCKET::ARM_DATARESPONSE")
  (make-package "ROS_SOCKET::ARM_DATARESPONSE"))

(in-package "ROS")





(defclass ROS_Socket::arm_dataRequest
  :super ros::object
  :slots (_x _y _z _pitch _roll _yaw ))

(defmethod ROS_Socket::arm_dataRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:pitch __pitch) 0.0)
    ((:roll __roll) 0.0)
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _pitch (float __pitch))
   (setq _roll (float __roll))
   (setq _yaw (float __yaw))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _pitch
    8
    ;; float64 _roll
    8
    ;; float64 _yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ROS_Socket::arm_dataResponse
  :super ros::object
  :slots (_response ))

(defmethod ROS_Socket::arm_dataResponse
  (:init
   (&key
    ((:response __response) 0)
    )
   (send-super :init)
   (setq _response (round __response))
   self)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; int32 _response
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _response
       (write-long _response s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _response
     (setq _response (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::arm_data
  :super ros::object
  :slots ())

(setf (get ROS_Socket::arm_data :md5sum-) "3bf33ada770441905ffbefcb06a48c2e")
(setf (get ROS_Socket::arm_data :datatype-) "ROS_Socket/arm_data")
(setf (get ROS_Socket::arm_data :request) ROS_Socket::arm_dataRequest)
(setf (get ROS_Socket::arm_data :response) ROS_Socket::arm_dataResponse)

(defmethod ROS_Socket::arm_dataRequest
  (:response () (instance ROS_Socket::arm_dataResponse :init)))

(setf (get ROS_Socket::arm_dataRequest :md5sum-) "3bf33ada770441905ffbefcb06a48c2e")
(setf (get ROS_Socket::arm_dataRequest :datatype-) "ROS_Socket/arm_dataRequest")
(setf (get ROS_Socket::arm_dataRequest :definition-)
      "float64 x
float64 y
float64 z
float64 pitch
float64 roll
float64 yaw
---
int32 response

")

(setf (get ROS_Socket::arm_dataResponse :md5sum-) "3bf33ada770441905ffbefcb06a48c2e")
(setf (get ROS_Socket::arm_dataResponse :datatype-) "ROS_Socket/arm_dataResponse")
(setf (get ROS_Socket::arm_dataResponse :definition-)
      "float64 x
float64 y
float64 z
float64 pitch
float64 roll
float64 yaw
---
int32 response

")



(provide :ROS_Socket/arm_data "3bf33ada770441905ffbefcb06a48c2e")


