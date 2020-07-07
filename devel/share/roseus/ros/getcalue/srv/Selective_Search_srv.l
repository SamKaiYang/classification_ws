;; Auto-generated. Do not edit!


(when (boundp 'getcalue::Selective_Search_srv)
  (if (not (find-package "GETCALUE"))
    (make-package "GETCALUE"))
  (shadow 'Selective_Search_srv (find-package "GETCALUE")))
(unless (find-package "GETCALUE::SELECTIVE_SEARCH_SRV")
  (make-package "GETCALUE::SELECTIVE_SEARCH_SRV"))
(unless (find-package "GETCALUE::SELECTIVE_SEARCH_SRVREQUEST")
  (make-package "GETCALUE::SELECTIVE_SEARCH_SRVREQUEST"))
(unless (find-package "GETCALUE::SELECTIVE_SEARCH_SRVRESPONSE")
  (make-package "GETCALUE::SELECTIVE_SEARCH_SRVRESPONSE"))

(in-package "ROS")





(defclass getcalue::Selective_Search_srvRequest
  :super ros::object
  :slots (_input ))

(defmethod getcalue::Selective_Search_srvRequest
  (:init
   (&key
    ((:input __input) 0)
    )
   (send-super :init)
   (setq _input (round __input))
   self)
  (:input
   (&optional __input)
   (if __input (setq _input __input)) _input)
  (:serialization-length
   ()
   (+
    ;; int64 _input
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _input
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _input (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _input) (= (length (_input . bv)) 2)) ;; bignum
              (write-long (ash (elt (_input . bv) 0) 0) s)
              (write-long (ash (elt (_input . bv) 1) -1) s))
             ((and (class _input) (= (length (_input . bv)) 1)) ;; big1
              (write-long (elt (_input . bv) 0) s)
              (write-long (if (>= _input 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _input s)(write-long (if (>= _input 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _input
#+(or :alpha :irix6 :x86_64)
      (setf _input (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _input (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass getcalue::Selective_Search_srvResponse
  :super ros::object
  :slots (_x _y _w _h _depth ))

(defmethod getcalue::Selective_Search_srvResponse
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:w __w) 0.0)
    ((:h __h) 0.0)
    ((:depth __depth) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _w (float __w))
   (setq _h (float __h))
   (setq _depth (float __depth))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _w
    4
    ;; float32 _h
    4
    ;; float32 _depth
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
     ;; float32 _w
       (sys::poke _w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _h
       (sys::poke _h (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _depth
       (sys::poke _depth (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _w
     (setq _w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _h
     (setq _h (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _depth
     (setq _depth (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass getcalue::Selective_Search_srv
  :super ros::object
  :slots ())

(setf (get getcalue::Selective_Search_srv :md5sum-) "18c14c3bda66d95b24244dd6b7b2ba3f")
(setf (get getcalue::Selective_Search_srv :datatype-) "getcalue/Selective_Search_srv")
(setf (get getcalue::Selective_Search_srv :request) getcalue::Selective_Search_srvRequest)
(setf (get getcalue::Selective_Search_srv :response) getcalue::Selective_Search_srvResponse)

(defmethod getcalue::Selective_Search_srvRequest
  (:response () (instance getcalue::Selective_Search_srvResponse :init)))

(setf (get getcalue::Selective_Search_srvRequest :md5sum-) "18c14c3bda66d95b24244dd6b7b2ba3f")
(setf (get getcalue::Selective_Search_srvRequest :datatype-) "getcalue/Selective_Search_srvRequest")
(setf (get getcalue::Selective_Search_srvRequest :definition-)
      "int64 input
---
float32 x
float32 y
float32 w
float32 h
float32 depth

")

(setf (get getcalue::Selective_Search_srvResponse :md5sum-) "18c14c3bda66d95b24244dd6b7b2ba3f")
(setf (get getcalue::Selective_Search_srvResponse :datatype-) "getcalue/Selective_Search_srvResponse")
(setf (get getcalue::Selective_Search_srvResponse :definition-)
      "int64 input
---
float32 x
float32 y
float32 w
float32 h
float32 depth

")



(provide :getcalue/Selective_Search_srv "18c14c3bda66d95b24244dd6b7b2ba3f")


