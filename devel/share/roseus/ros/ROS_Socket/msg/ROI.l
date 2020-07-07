;; Auto-generated. Do not edit!


(when (boundp 'ROS_Socket::ROI)
  (if (not (find-package "ROS_SOCKET"))
    (make-package "ROS_SOCKET"))
  (shadow 'ROI (find-package "ROS_SOCKET")))
(unless (find-package "ROS_SOCKET::ROI")
  (make-package "ROS_SOCKET::ROI"))

(in-package "ROS")
;;//! \htmlinclude ROI.msg.html


(defclass ROS_Socket::ROI
  :super ros::object
  :slots (_object_name _score _min_x _Max_x _min_y _Max_y ))

(defmethod ROS_Socket::ROI
  (:init
   (&key
    ((:object_name __object_name) "")
    ((:score __score) 0.0)
    ((:min_x __min_x) 0)
    ((:Max_x __Max_x) 0)
    ((:min_y __min_y) 0)
    ((:Max_y __Max_y) 0)
    )
   (send-super :init)
   (setq _object_name (string __object_name))
   (setq _score (float __score))
   (setq _min_x (round __min_x))
   (setq _Max_x (round __Max_x))
   (setq _min_y (round __min_y))
   (setq _Max_y (round __Max_y))
   self)
  (:object_name
   (&optional __object_name)
   (if __object_name (setq _object_name __object_name)) _object_name)
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:min_x
   (&optional __min_x)
   (if __min_x (setq _min_x __min_x)) _min_x)
  (:Max_x
   (&optional __Max_x)
   (if __Max_x (setq _Max_x __Max_x)) _Max_x)
  (:min_y
   (&optional __min_y)
   (if __min_y (setq _min_y __min_y)) _min_y)
  (:Max_y
   (&optional __Max_y)
   (if __Max_y (setq _Max_y __Max_y)) _Max_y)
  (:serialization-length
   ()
   (+
    ;; string _object_name
    4 (length _object_name)
    ;; float32 _score
    4
    ;; int32 _min_x
    4
    ;; int32 _Max_x
    4
    ;; int32 _min_y
    4
    ;; int32 _Max_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _object_name
       (write-long (length _object_name) s) (princ _object_name s)
     ;; float32 _score
       (sys::poke _score (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _min_x
       (write-long _min_x s)
     ;; int32 _Max_x
       (write-long _Max_x s)
     ;; int32 _min_y
       (write-long _min_y s)
     ;; int32 _Max_y
       (write-long _Max_y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _object_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _object_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _score
     (setq _score (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _min_x
     (setq _min_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Max_x
     (setq _Max_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _min_y
     (setq _min_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Max_y
     (setq _Max_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ROS_Socket::ROI :md5sum-) "94c6de870ee9725e733216fafc995b64")
(setf (get ROS_Socket::ROI :datatype-) "ROS_Socket/ROI")
(setf (get ROS_Socket::ROI :definition-)
      "string object_name
float32 score
int32 min_x
int32 Max_x
int32 min_y
int32 Max_y

")



(provide :ROS_Socket/ROI "94c6de870ee9725e733216fafc995b64")


