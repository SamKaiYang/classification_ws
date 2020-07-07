;; Auto-generated. Do not edit!


(when (boundp 'ROS_Socket::sent_flag)
  (if (not (find-package "ROS_SOCKET"))
    (make-package "ROS_SOCKET"))
  (shadow 'sent_flag (find-package "ROS_SOCKET")))
(unless (find-package "ROS_SOCKET::SENT_FLAG")
  (make-package "ROS_SOCKET::SENT_FLAG"))
(unless (find-package "ROS_SOCKET::SENT_FLAGREQUEST")
  (make-package "ROS_SOCKET::SENT_FLAGREQUEST"))
(unless (find-package "ROS_SOCKET::SENT_FLAGRESPONSE")
  (make-package "ROS_SOCKET::SENT_FLAGRESPONSE"))

(in-package "ROS")





(defclass ROS_Socket::sent_flagRequest
  :super ros::object
  :slots (_sent_flag ))

(defmethod ROS_Socket::sent_flagRequest
  (:init
   (&key
    ((:sent_flag __sent_flag) 0)
    )
   (send-super :init)
   (setq _sent_flag (round __sent_flag))
   self)
  (:sent_flag
   (&optional __sent_flag)
   (if __sent_flag (setq _sent_flag __sent_flag)) _sent_flag)
  (:serialization-length
   ()
   (+
    ;; int32 _sent_flag
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sent_flag
       (write-long _sent_flag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sent_flag
     (setq _sent_flag (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::sent_flagResponse
  :super ros::object
  :slots (_sent_flag_feedback ))

(defmethod ROS_Socket::sent_flagResponse
  (:init
   (&key
    ((:sent_flag_feedback __sent_flag_feedback) 0)
    )
   (send-super :init)
   (setq _sent_flag_feedback (round __sent_flag_feedback))
   self)
  (:sent_flag_feedback
   (&optional __sent_flag_feedback)
   (if __sent_flag_feedback (setq _sent_flag_feedback __sent_flag_feedback)) _sent_flag_feedback)
  (:serialization-length
   ()
   (+
    ;; int32 _sent_flag_feedback
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sent_flag_feedback
       (write-long _sent_flag_feedback s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sent_flag_feedback
     (setq _sent_flag_feedback (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ROS_Socket::sent_flag
  :super ros::object
  :slots ())

(setf (get ROS_Socket::sent_flag :md5sum-) "6e5879da81627af41fb741e0047f9b21")
(setf (get ROS_Socket::sent_flag :datatype-) "ROS_Socket/sent_flag")
(setf (get ROS_Socket::sent_flag :request) ROS_Socket::sent_flagRequest)
(setf (get ROS_Socket::sent_flag :response) ROS_Socket::sent_flagResponse)

(defmethod ROS_Socket::sent_flagRequest
  (:response () (instance ROS_Socket::sent_flagResponse :init)))

(setf (get ROS_Socket::sent_flagRequest :md5sum-) "6e5879da81627af41fb741e0047f9b21")
(setf (get ROS_Socket::sent_flagRequest :datatype-) "ROS_Socket/sent_flagRequest")
(setf (get ROS_Socket::sent_flagRequest :definition-)
      "int32 sent_flag
---
int32 sent_flag_feedback

")

(setf (get ROS_Socket::sent_flagResponse :md5sum-) "6e5879da81627af41fb741e0047f9b21")
(setf (get ROS_Socket::sent_flagResponse :datatype-) "ROS_Socket/sent_flagResponse")
(setf (get ROS_Socket::sent_flagResponse :definition-)
      "int32 sent_flag
---
int32 sent_flag_feedback

")



(provide :ROS_Socket/sent_flag "6e5879da81627af41fb741e0047f9b21")


