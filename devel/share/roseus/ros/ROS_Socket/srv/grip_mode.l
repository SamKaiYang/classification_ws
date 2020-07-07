;; Auto-generated. Do not edit!


(when (boundp 'ROS_Socket::grip_mode)
  (if (not (find-package "ROS_SOCKET"))
    (make-package "ROS_SOCKET"))
  (shadow 'grip_mode (find-package "ROS_SOCKET")))
(unless (find-package "ROS_SOCKET::GRIP_MODE")
  (make-package "ROS_SOCKET::GRIP_MODE"))
(unless (find-package "ROS_SOCKET::GRIP_MODEREQUEST")
  (make-package "ROS_SOCKET::GRIP_MODEREQUEST"))
(unless (find-package "ROS_SOCKET::GRIP_MODERESPONSE")
  (make-package "ROS_SOCKET::GRIP_MODERESPONSE"))

(in-package "ROS")





(defclass ROS_Socket::grip_modeRequest
  :super ros::object
  :slots (_grip ))

(defmethod ROS_Socket::grip_modeRequest
  (:init
   (&key
    ((:grip __grip) 0)
    )
   (send-super :init)
   (setq _grip (round __grip))
   self)
  (:grip
   (&optional __grip)
   (if __grip (setq _grip __grip)) _grip)
  (:serialization-length
   ()
   (+
    ;; int32 _grip
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _grip
       (write-long _grip s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _grip
     (setq _grip (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::grip_modeResponse
  :super ros::object
  :slots (_grip_feedback ))

(defmethod ROS_Socket::grip_modeResponse
  (:init
   (&key
    ((:grip_feedback __grip_feedback) 0)
    )
   (send-super :init)
   (setq _grip_feedback (round __grip_feedback))
   self)
  (:grip_feedback
   (&optional __grip_feedback)
   (if __grip_feedback (setq _grip_feedback __grip_feedback)) _grip_feedback)
  (:serialization-length
   ()
   (+
    ;; int32 _grip_feedback
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _grip_feedback
       (write-long _grip_feedback s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _grip_feedback
     (setq _grip_feedback (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::grip_mode
  :super ros::object
  :slots ())

(setf (get ROS_Socket::grip_mode :md5sum-) "d92a2d9da83c00d7d8de417445c123ec")
(setf (get ROS_Socket::grip_mode :datatype-) "ROS_Socket/grip_mode")
(setf (get ROS_Socket::grip_mode :request) ROS_Socket::grip_modeRequest)
(setf (get ROS_Socket::grip_mode :response) ROS_Socket::grip_modeResponse)

(defmethod ROS_Socket::grip_modeRequest
  (:response () (instance ROS_Socket::grip_modeResponse :init)))

(setf (get ROS_Socket::grip_modeRequest :md5sum-) "d92a2d9da83c00d7d8de417445c123ec")
(setf (get ROS_Socket::grip_modeRequest :datatype-) "ROS_Socket/grip_modeRequest")
(setf (get ROS_Socket::grip_modeRequest :definition-)
      "int32 grip
---
int32 grip_feedback

")

(setf (get ROS_Socket::grip_modeResponse :md5sum-) "d92a2d9da83c00d7d8de417445c123ec")
(setf (get ROS_Socket::grip_modeResponse :datatype-) "ROS_Socket/grip_modeResponse")
(setf (get ROS_Socket::grip_modeResponse :definition-)
      "int32 grip
---
int32 grip_feedback

")



(provide :ROS_Socket/grip_mode "d92a2d9da83c00d7d8de417445c123ec")


