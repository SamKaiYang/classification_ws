;; Auto-generated. Do not edit!


(when (boundp 'ROS_Socket::ros_cmd)
  (if (not (find-package "ROS_SOCKET"))
    (make-package "ROS_SOCKET"))
  (shadow 'ros_cmd (find-package "ROS_SOCKET")))
(unless (find-package "ROS_SOCKET::ROS_CMD")
  (make-package "ROS_SOCKET::ROS_CMD"))

(in-package "ROS")
;;//! \htmlinclude ros_cmd.msg.html


(defclass ROS_Socket::ros_cmd
  :super ros::object
  :slots (_Arm_State_feedback ))

(defmethod ROS_Socket::ros_cmd
  (:init
   (&key
    ((:Arm_State_feedback __Arm_State_feedback) 0)
    )
   (send-super :init)
   (setq _Arm_State_feedback (round __Arm_State_feedback))
   self)
  (:Arm_State_feedback
   (&optional __Arm_State_feedback)
   (if __Arm_State_feedback (setq _Arm_State_feedback __Arm_State_feedback)) _Arm_State_feedback)
  (:serialization-length
   ()
   (+
    ;; int32 _Arm_State_feedback
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _Arm_State_feedback
       (write-long _Arm_State_feedback s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _Arm_State_feedback
     (setq _Arm_State_feedback (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ROS_Socket::ros_cmd :md5sum-) "2b5d469cbc8bdcbdfd4b75c0d0da98bb")
(setf (get ROS_Socket::ros_cmd :datatype-) "ROS_Socket/ros_cmd")
(setf (get ROS_Socket::ros_cmd :definition-)
      "int32 Arm_State_feedback

")



(provide :ROS_Socket/ros_cmd "2b5d469cbc8bdcbdfd4b75c0d0da98bb")


