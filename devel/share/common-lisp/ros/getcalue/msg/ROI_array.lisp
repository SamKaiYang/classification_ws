; Auto-generated. Do not edit!


(cl:in-package getcalue-msg)


;//! \htmlinclude ROI_array.msg.html

(cl:defclass <ROI_array> (roslisp-msg-protocol:ros-message)
  ((ROI_list
    :reader ROI_list
    :initarg :ROI_list
    :type (cl:vector getcalue-msg:ROI)
   :initform (cl:make-array 0 :element-type 'getcalue-msg:ROI :initial-element (cl:make-instance 'getcalue-msg:ROI))))
)

(cl:defclass ROI_array (<ROI_array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ROI_array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ROI_array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name getcalue-msg:<ROI_array> is deprecated: use getcalue-msg:ROI_array instead.")))

(cl:ensure-generic-function 'ROI_list-val :lambda-list '(m))
(cl:defmethod ROI_list-val ((m <ROI_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader getcalue-msg:ROI_list-val is deprecated.  Use getcalue-msg:ROI_list instead.")
  (ROI_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ROI_array>) ostream)
  "Serializes a message object of type '<ROI_array>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ROI_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ROI_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ROI_array>) istream)
  "Deserializes a message object of type '<ROI_array>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ROI_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ROI_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'getcalue-msg:ROI))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ROI_array>)))
  "Returns string type for a message object of type '<ROI_array>"
  "getcalue/ROI_array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ROI_array)))
  "Returns string type for a message object of type 'ROI_array"
  "getcalue/ROI_array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ROI_array>)))
  "Returns md5sum for a message object of type '<ROI_array>"
  "830846477b2f91488efcf13bb1eeda9f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ROI_array)))
  "Returns md5sum for a message object of type 'ROI_array"
  "830846477b2f91488efcf13bb1eeda9f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ROI_array>)))
  "Returns full string definition for message of type '<ROI_array>"
  (cl:format cl:nil "ROI[] ROI_list~%~%================================================================================~%MSG: getcalue/ROI~%string object_name~%float32 score~%int32 min_x~%int32 Max_x~%int32 min_y~%int32 Max_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ROI_array)))
  "Returns full string definition for message of type 'ROI_array"
  (cl:format cl:nil "ROI[] ROI_list~%~%================================================================================~%MSG: getcalue/ROI~%string object_name~%float32 score~%int32 min_x~%int32 Max_x~%int32 min_y~%int32 Max_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ROI_array>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ROI_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ROI_array>))
  "Converts a ROS message object to a list"
  (cl:list 'ROI_array
    (cl:cons ':ROI_list (ROI_list msg))
))
