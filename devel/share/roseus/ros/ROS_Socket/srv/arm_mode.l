;; Auto-generated. Do not edit!


(when (boundp 'ROS_Socket::arm_mode)
  (if (not (find-package "ROS_SOCKET"))
    (make-package "ROS_SOCKET"))
  (shadow 'arm_mode (find-package "ROS_SOCKET")))
(unless (find-package "ROS_SOCKET::ARM_MODE")
  (make-package "ROS_SOCKET::ARM_MODE"))
(unless (find-package "ROS_SOCKET::ARM_MODEREQUEST")
  (make-package "ROS_SOCKET::ARM_MODEREQUEST"))
(unless (find-package "ROS_SOCKET::ARM_MODERESPONSE")
  (make-package "ROS_SOCKET::ARM_MODERESPONSE"))

(in-package "ROS")





(defclass ROS_Socket::arm_modeRequest
  :super ros::object
  :slots (_ra _action _grip _vel _both ))

(defmethod ROS_Socket::arm_modeRequest
  (:init
   (&key
    ((:ra __ra) 0)
    ((:action __action) 0)
    ((:grip __grip) 0)
    ((:vel __vel) 0)
    ((:both __both) 0)
    )
   (send-super :init)
   (setq _ra (round __ra))
   (setq _action (round __action))
   (setq _grip (round __grip))
   (setq _vel (round __vel))
   (setq _both (round __both))
   self)
  (:ra
   (&optional __ra)
   (if __ra (setq _ra __ra)) _ra)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:grip
   (&optional __grip)
   (if __grip (setq _grip __grip)) _grip)
  (:vel
   (&optional __vel)
   (if __vel (setq _vel __vel)) _vel)
  (:both
   (&optional __both)
   (if __both (setq _both __both)) _both)
  (:serialization-length
   ()
   (+
    ;; int32 _ra
    4
    ;; int32 _action
    4
    ;; int32 _grip
    4
    ;; int32 _vel
    4
    ;; int32 _both
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _ra
       (write-long _ra s)
     ;; int32 _action
       (write-long _action s)
     ;; int32 _grip
       (write-long _grip s)
     ;; int32 _vel
       (write-long _vel s)
     ;; int32 _both
       (write-long _both s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _ra
     (setq _ra (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _action
     (setq _action (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _grip
     (setq _grip (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _vel
     (setq _vel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _both
     (setq _both (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::arm_modeResponse
  :super ros::object
  :slots (_mode ))

(defmethod ROS_Socket::arm_modeResponse
  (:init
   (&key
    ((:mode __mode) 0)
    )
   (send-super :init)
   (setq _mode (round __mode))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; int32 _mode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _mode
       (write-long _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::arm_mode
  :super ros::object
  :slots ())

(setf (get ROS_Socket::arm_mode :md5sum-) "b362365c058a7d0b0b5500677cb1d63b")
(setf (get ROS_Socket::arm_mode :datatype-) "ROS_Socket/arm_mode")
(setf (get ROS_Socket::arm_mode :request) ROS_Socket::arm_modeRequest)
(setf (get ROS_Socket::arm_mode :response) ROS_Socket::arm_modeResponse)

(defmethod ROS_Socket::arm_modeRequest
  (:response () (instance ROS_Socket::arm_modeResponse :init)))

(setf (get ROS_Socket::arm_modeRequest :md5sum-) "b362365c058a7d0b0b5500677cb1d63b")
(setf (get ROS_Socket::arm_modeRequest :datatype-) "ROS_Socket/arm_modeRequest")
(setf (get ROS_Socket::arm_modeRequest :definition-)
      "int32 ra
int32 action
int32 grip
int32 vel
int32 both
---
int32 mode

")

(setf (get ROS_Socket::arm_modeResponse :md5sum-) "b362365c058a7d0b0b5500677cb1d63b")
(setf (get ROS_Socket::arm_modeResponse :datatype-) "ROS_Socket/arm_modeResponse")
(setf (get ROS_Socket::arm_modeResponse :definition-)
      "int32 ra
int32 action
int32 grip
int32 vel
int32 both
---
int32 mode

")



(provide :ROS_Socket/arm_mode "b362365c058a7d0b0b5500677cb1d63b")


