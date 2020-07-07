;; Auto-generated. Do not edit!


(when (boundp 'ROS_Socket::arm_state)
  (if (not (find-package "ROS_SOCKET"))
    (make-package "ROS_SOCKET"))
  (shadow 'arm_state (find-package "ROS_SOCKET")))
(unless (find-package "ROS_SOCKET::ARM_STATE")
  (make-package "ROS_SOCKET::ARM_STATE"))
(unless (find-package "ROS_SOCKET::ARM_STATEREQUEST")
  (make-package "ROS_SOCKET::ARM_STATEREQUEST"))
(unless (find-package "ROS_SOCKET::ARM_STATERESPONSE")
  (make-package "ROS_SOCKET::ARM_STATERESPONSE"))

(in-package "ROS")





(defclass ROS_Socket::arm_stateRequest
  :super ros::object
  :slots (_Arm_state ))

(defmethod ROS_Socket::arm_stateRequest
  (:init
   (&key
    ((:Arm_state __Arm_state) 0)
    )
   (send-super :init)
   (setq _Arm_state (round __Arm_state))
   self)
  (:Arm_state
   (&optional __Arm_state)
   (if __Arm_state (setq _Arm_state __Arm_state)) _Arm_state)
  (:serialization-length
   ()
   (+
    ;; int32 _Arm_state
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _Arm_state
       (write-long _Arm_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _Arm_state
     (setq _Arm_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::arm_stateResponse
  :super ros::object
  :slots (_state ))

(defmethod ROS_Socket::arm_stateResponse
  (:init
   (&key
    ((:state __state) 0)
    )
   (send-super :init)
   (setq _state (round __state))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; int32 _state
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _state
       (write-long _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _state
     (setq _state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::arm_state
  :super ros::object
  :slots ())

(setf (get ROS_Socket::arm_state :md5sum-) "9a18ae858978714c254ecb02ef2924b7")
(setf (get ROS_Socket::arm_state :datatype-) "ROS_Socket/arm_state")
(setf (get ROS_Socket::arm_state :request) ROS_Socket::arm_stateRequest)
(setf (get ROS_Socket::arm_state :response) ROS_Socket::arm_stateResponse)

(defmethod ROS_Socket::arm_stateRequest
  (:response () (instance ROS_Socket::arm_stateResponse :init)))

(setf (get ROS_Socket::arm_stateRequest :md5sum-) "9a18ae858978714c254ecb02ef2924b7")
(setf (get ROS_Socket::arm_stateRequest :datatype-) "ROS_Socket/arm_stateRequest")
(setf (get ROS_Socket::arm_stateRequest :definition-)
      "int32 Arm_state
---
int32 state

")

(setf (get ROS_Socket::arm_stateResponse :md5sum-) "9a18ae858978714c254ecb02ef2924b7")
(setf (get ROS_Socket::arm_stateResponse :datatype-) "ROS_Socket/arm_stateResponse")
(setf (get ROS_Socket::arm_stateResponse :definition-)
      "int32 Arm_state
---
int32 state

")



(provide :ROS_Socket/arm_state "9a18ae858978714c254ecb02ef2924b7")


