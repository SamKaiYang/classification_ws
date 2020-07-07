; Auto-generated. Do not edit!


(cl:in-package disposing_vision-msg)


;//! \htmlinclude coordinate_normal.msg.html

(cl:defclass <coordinate_normal> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (normal_x
    :reader normal_x
    :initarg :normal_x
    :type cl:float
    :initform 0.0)
   (normal_y
    :reader normal_y
    :initarg :normal_y
    :type cl:float
    :initform 0.0)
   (normal_z
    :reader normal_z
    :initarg :normal_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass coordinate_normal (<coordinate_normal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <coordinate_normal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'coordinate_normal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name disposing_vision-msg:<coordinate_normal> is deprecated: use disposing_vision-msg:coordinate_normal instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <coordinate_normal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader disposing_vision-msg:x-val is deprecated.  Use disposing_vision-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <coordinate_normal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader disposing_vision-msg:y-val is deprecated.  Use disposing_vision-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <coordinate_normal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader disposing_vision-msg:z-val is deprecated.  Use disposing_vision-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'normal_x-val :lambda-list '(m))
(cl:defmethod normal_x-val ((m <coordinate_normal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader disposing_vision-msg:normal_x-val is deprecated.  Use disposing_vision-msg:normal_x instead.")
  (normal_x m))

(cl:ensure-generic-function 'normal_y-val :lambda-list '(m))
(cl:defmethod normal_y-val ((m <coordinate_normal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader disposing_vision-msg:normal_y-val is deprecated.  Use disposing_vision-msg:normal_y instead.")
  (normal_y m))

(cl:ensure-generic-function 'normal_z-val :lambda-list '(m))
(cl:defmethod normal_z-val ((m <coordinate_normal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader disposing_vision-msg:normal_z-val is deprecated.  Use disposing_vision-msg:normal_z instead.")
  (normal_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <coordinate_normal>) ostream)
  "Serializes a message object of type '<coordinate_normal>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'normal_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'normal_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'normal_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <coordinate_normal>) istream)
  "Deserializes a message object of type '<coordinate_normal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'normal_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'normal_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'normal_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<coordinate_normal>)))
  "Returns string type for a message object of type '<coordinate_normal>"
  "disposing_vision/coordinate_normal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'coordinate_normal)))
  "Returns string type for a message object of type 'coordinate_normal"
  "disposing_vision/coordinate_normal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<coordinate_normal>)))
  "Returns md5sum for a message object of type '<coordinate_normal>"
  "ee0ea2f53dcc000e5f2603d8a2d15279")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'coordinate_normal)))
  "Returns md5sum for a message object of type 'coordinate_normal"
  "ee0ea2f53dcc000e5f2603d8a2d15279")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<coordinate_normal>)))
  "Returns full string definition for message of type '<coordinate_normal>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%float32 normal_x~%float32 normal_y~%float32 normal_z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'coordinate_normal)))
  "Returns full string definition for message of type 'coordinate_normal"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%float32 normal_x~%float32 normal_y~%float32 normal_z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <coordinate_normal>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <coordinate_normal>))
  "Converts a ROS message object to a list"
  (cl:list 'coordinate_normal
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':normal_x (normal_x msg))
    (cl:cons ':normal_y (normal_y msg))
    (cl:cons ':normal_z (normal_z msg))
))
