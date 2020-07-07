;; Auto-generated. Do not edit!


(when (boundp 'getcalue::ROI_array)
  (if (not (find-package "GETCALUE"))
    (make-package "GETCALUE"))
  (shadow 'ROI_array (find-package "GETCALUE")))
(unless (find-package "GETCALUE::ROI_ARRAY")
  (make-package "GETCALUE::ROI_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude ROI_array.msg.html


(defclass getcalue::ROI_array
  :super ros::object
  :slots (_ROI_list ))

(defmethod getcalue::ROI_array
  (:init
   (&key
    ((:ROI_list __ROI_list) (let (r) (dotimes (i 0) (push (instance getcalue::ROI :init) r)) r))
    )
   (send-super :init)
   (setq _ROI_list __ROI_list)
   self)
  (:ROI_list
   (&rest __ROI_list)
   (if (keywordp (car __ROI_list))
       (send* _ROI_list __ROI_list)
     (progn
       (if __ROI_list (setq _ROI_list (car __ROI_list)))
       _ROI_list)))
  (:serialization-length
   ()
   (+
    ;; getcalue/ROI[] _ROI_list
    (apply #'+ (send-all _ROI_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; getcalue/ROI[] _ROI_list
     (write-long (length _ROI_list) s)
     (dolist (elem _ROI_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; getcalue/ROI[] _ROI_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ROI_list (let (r) (dotimes (i n) (push (instance getcalue::ROI :init) r)) r))
     (dolist (elem- _ROI_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get getcalue::ROI_array :md5sum-) "830846477b2f91488efcf13bb1eeda9f")
(setf (get getcalue::ROI_array :datatype-) "getcalue/ROI_array")
(setf (get getcalue::ROI_array :definition-)
      "ROI[] ROI_list

================================================================================
MSG: getcalue/ROI
string object_name
float32 score
int32 min_x
int32 Max_x
int32 min_y
int32 Max_y

")



(provide :getcalue/ROI_array "830846477b2f91488efcf13bb1eeda9f")


