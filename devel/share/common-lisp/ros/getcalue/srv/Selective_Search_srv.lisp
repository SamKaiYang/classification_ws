; Auto-generated. Do not edit!


(cl:in-package getcalue-srv)


;//! \htmlinclude Selective_Search_srv-request.msg.html

(cl:defclass <Selective_Search_srv-request> (roslisp-msg-protocol:ros-message)
  ((input
    :reader input
    :initarg :input
    :type cl:integer
    :initform 0))
)

(cl:defclass Selective_Search_srv-request (<Selective_Search_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Selective_Search_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Selective_Search_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name getcalue-srv:<Selective_Search_srv-request> is deprecated: use getcalue-srv:Selective_Search_srv-request instead.")))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <Selective_Search_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader getcalue-srv:input-val is deprecated.  Use getcalue-srv:input instead.")
  (input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Selective_Search_srv-request>) ostream)
  "Serializes a message object of type '<Selective_Search_srv-request>"
  (cl:let* ((signed (cl:slot-value msg 'input)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Selective_Search_srv-request>) istream)
  "Deserializes a message object of type '<Selective_Search_srv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Selective_Search_srv-request>)))
  "Returns string type for a service object of type '<Selective_Search_srv-request>"
  "getcalue/Selective_Search_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Selective_Search_srv-request)))
  "Returns string type for a service object of type 'Selective_Search_srv-request"
  "getcalue/Selective_Search_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Selective_Search_srv-request>)))
  "Returns md5sum for a message object of type '<Selective_Search_srv-request>"
  "18c14c3bda66d95b24244dd6b7b2ba3f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Selective_Search_srv-request)))
  "Returns md5sum for a message object of type 'Selective_Search_srv-request"
  "18c14c3bda66d95b24244dd6b7b2ba3f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Selective_Search_srv-request>)))
  "Returns full string definition for message of type '<Selective_Search_srv-request>"
  (cl:format cl:nil "int64 input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Selective_Search_srv-request)))
  "Returns full string definition for message of type 'Selective_Search_srv-request"
  (cl:format cl:nil "int64 input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Selective_Search_srv-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Selective_Search_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Selective_Search_srv-request
    (cl:cons ':input (input msg))
))
;//! \htmlinclude Selective_Search_srv-response.msg.html

(cl:defclass <Selective_Search_srv-response> (roslisp-msg-protocol:ros-message)
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
   (w
    :reader w
    :initarg :w
    :type cl:float
    :initform 0.0)
   (h
    :reader h
    :initarg :h
    :type cl:float
    :initform 0.0)
   (depth
    :reader depth
    :initarg :depth
    :type cl:float
    :initform 0.0))
)

(cl:defclass Selective_Search_srv-response (<Selective_Search_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Selective_Search_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Selective_Search_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name getcalue-srv:<Selective_Search_srv-response> is deprecated: use getcalue-srv:Selective_Search_srv-response instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Selective_Search_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader getcalue-srv:x-val is deprecated.  Use getcalue-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Selective_Search_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader getcalue-srv:y-val is deprecated.  Use getcalue-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'w-val :lambda-list '(m))
(cl:defmethod w-val ((m <Selective_Search_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader getcalue-srv:w-val is deprecated.  Use getcalue-srv:w instead.")
  (w m))

(cl:ensure-generic-function 'h-val :lambda-list '(m))
(cl:defmethod h-val ((m <Selective_Search_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader getcalue-srv:h-val is deprecated.  Use getcalue-srv:h instead.")
  (h m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <Selective_Search_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader getcalue-srv:depth-val is deprecated.  Use getcalue-srv:depth instead.")
  (depth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Selective_Search_srv-response>) ostream)
  "Serializes a message object of type '<Selective_Search_srv-response>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'w))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'h))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Selective_Search_srv-response>) istream)
  "Deserializes a message object of type '<Selective_Search_srv-response>"
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
    (cl:setf (cl:slot-value msg 'w) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'h) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Selective_Search_srv-response>)))
  "Returns string type for a service object of type '<Selective_Search_srv-response>"
  "getcalue/Selective_Search_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Selective_Search_srv-response)))
  "Returns string type for a service object of type 'Selective_Search_srv-response"
  "getcalue/Selective_Search_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Selective_Search_srv-response>)))
  "Returns md5sum for a message object of type '<Selective_Search_srv-response>"
  "18c14c3bda66d95b24244dd6b7b2ba3f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Selective_Search_srv-response)))
  "Returns md5sum for a message object of type 'Selective_Search_srv-response"
  "18c14c3bda66d95b24244dd6b7b2ba3f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Selective_Search_srv-response>)))
  "Returns full string definition for message of type '<Selective_Search_srv-response>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 w~%float32 h~%float32 depth~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Selective_Search_srv-response)))
  "Returns full string definition for message of type 'Selective_Search_srv-response"
  (cl:format cl:nil "float32 x~%float32 y~%float32 w~%float32 h~%float32 depth~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Selective_Search_srv-response>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Selective_Search_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Selective_Search_srv-response
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':w (w msg))
    (cl:cons ':h (h msg))
    (cl:cons ':depth (depth msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Selective_Search_srv)))
  'Selective_Search_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Selective_Search_srv)))
  'Selective_Search_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Selective_Search_srv)))
  "Returns string type for a service object of type '<Selective_Search_srv>"
  "getcalue/Selective_Search_srv")