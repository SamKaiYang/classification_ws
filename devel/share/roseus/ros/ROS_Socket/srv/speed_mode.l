;; Auto-generated. Do not edit!


(when (boundp 'ROS_Socket::speed_mode)
  (if (not (find-package "ROS_SOCKET"))
    (make-package "ROS_SOCKET"))
  (shadow 'speed_mode (find-package "ROS_SOCKET")))
(unless (find-package "ROS_SOCKET::SPEED_MODE")
  (make-package "ROS_SOCKET::SPEED_MODE"))
(unless (find-package "ROS_SOCKET::SPEED_MODEREQUEST")
  (make-package "ROS_SOCKET::SPEED_MODEREQUEST"))
(unless (find-package "ROS_SOCKET::SPEED_MODERESPONSE")
  (make-package "ROS_SOCKET::SPEED_MODERESPONSE"))

(in-package "ROS")





(defclass ROS_Socket::speed_modeRequest
  :super ros::object
  :slots (_Speedmode ))

(defmethod ROS_Socket::speed_modeRequest
  (:init
   (&key
    ((:Speedmode __Speedmode) 0)
    )
   (send-super :init)
   (setq _Speedmode (round __Speedmode))
   self)
  (:Speedmode
   (&optional __Speedmode)
   (if __Speedmode (setq _Speedmode __Speedmode)) _Speedmode)
  (:serialization-length
   ()
   (+
    ;; int32 _Speedmode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _Speedmode
       (write-long _Speedmode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _Speedmode
     (setq _Speedmode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::speed_modeResponse
  :super ros::object
  :slots (_feedback ))

(defmethod ROS_Socket::speed_modeResponse
  (:init
   (&key
    ((:feedback __feedback) 0)
    )
   (send-super :init)
   (setq _feedback (round __feedback))
   self)
  (:feedback
   (&optional __feedback)
   (if __feedback (setq _feedback __feedback)) _feedback)
  (:serialization-length
   ()
   (+
    ;; int32 _feedback
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _feedback
       (write-long _feedback s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _feedback
     (setq _feedback (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::speed_mode
  :super ros::object
  :slots ())

(setf (get ROS_Socket::speed_mode :md5sum-) "71efcf49fabc95bebfd108417405a10f")
(setf (get ROS_Socket::speed_mode :datatype-) "ROS_Socket/speed_mode")
(setf (get ROS_Socket::speed_mode :request) ROS_Socket::speed_modeRequest)
(setf (get ROS_Socket::speed_mode :response) ROS_Socket::speed_modeResponse)

(defmethod ROS_Socket::speed_modeRequest
  (:response () (instance ROS_Socket::speed_modeResponse :init)))

(setf (get ROS_Socket::speed_modeRequest :md5sum-) "71efcf49fabc95bebfd108417405a10f")
(setf (get ROS_Socket::speed_modeRequest :datatype-) "ROS_Socket/speed_modeRequest")
(setf (get ROS_Socket::speed_modeRequest :definition-)
      "int32 Speedmode
---
int32 feedback

")

(setf (get ROS_Socket::speed_modeResponse :md5sum-) "71efcf49fabc95bebfd108417405a10f")
(setf (get ROS_Socket::speed_modeResponse :datatype-) "ROS_Socket/speed_modeResponse")
(setf (get ROS_Socket::speed_modeResponse :definition-)
      "int32 Speedmode
---
int32 feedback

")



(provide :ROS_Socket/speed_mode "71efcf49fabc95bebfd108417405a10f")


