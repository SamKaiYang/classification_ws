;; Auto-generated. Do not edit!


(when (boundp 'disposing_vision::coordinate_normal)
  (if (not (find-package "DISPOSING_VISION"))
    (make-package "DISPOSING_VISION"))
  (shadow 'coordinate_normal (find-package "DISPOSING_VISION")))
(unless (find-package "DISPOSING_VISION::COORDINATE_NORMAL")
  (make-package "DISPOSING_VISION::COORDINATE_NORMAL"))

(in-package "ROS")
;;//! \htmlinclude coordinate_normal.msg.html


(defclass disposing_vision::coordinate_normal
  :super ros::object
  :slots (_x _y _z _normal_x _normal_y _normal_z ))

(defmethod disposing_vision::coordinate_normal
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:normal_x __normal_x) 0.0)
    ((:normal_y __normal_y) 0.0)
    ((:normal_z __normal_z) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _normal_x (float __normal_x))
   (setq _normal_y (float __normal_y))
   (setq _normal_z (float __normal_z))
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
  (:normal_x
   (&optional __normal_x)
   (if __normal_x (setq _normal_x __normal_x)) _normal_x)
  (:normal_y
   (&optional __normal_y)
   (if __normal_y (setq _normal_y __normal_y)) _normal_y)
  (:normal_z
   (&optional __normal_z)
   (if __normal_z (setq _normal_z __normal_z)) _normal_z)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; float32 _normal_x
    4
    ;; float32 _normal_y
    4
    ;; float32 _normal_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _normal_x
       (sys::poke _normal_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _normal_y
       (sys::poke _normal_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _normal_z
       (sys::poke _normal_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _normal_x
     (setq _normal_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _normal_y
     (setq _normal_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _normal_z
     (setq _normal_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get disposing_vision::coordinate_normal :md5sum-) "ee0ea2f53dcc000e5f2603d8a2d15279")
(setf (get disposing_vision::coordinate_normal :datatype-) "disposing_vision/coordinate_normal")
(setf (get disposing_vision::coordinate_normal :definition-)
      "float32 x
float32 y
float32 z
float32 normal_x
float32 normal_y
float32 normal_z
")



(provide :disposing_vision/coordinate_normal "ee0ea2f53dcc000e5f2603d8a2d15279")


