; Auto-generated. Do not edit!


(cl:in-package ROS_Socket-srv)


;//! \htmlinclude arm_mode-request.msg.html

(cl:defclass <arm_mode-request> (roslisp-msg-protocol:ros-message)
  ((ra
    :reader ra
    :initarg :ra
    :type cl:integer
    :initform 0)
   (action
    :reader action
    :initarg :action
    :type cl:integer
    :initform 0)
   (grip
    :reader grip
    :initarg :grip
    :type cl:integer
    :initform 0)
   (vel
    :reader vel
    :initarg :vel
    :type cl:integer
    :initform 0)
   (both
    :reader both
    :initarg :both
    :type cl:integer
    :initform 0))
)

(cl:defclass arm_mode-request (<arm_mode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arm_mode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arm_mode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-srv:<arm_mode-request> is deprecated: use ROS_Socket-srv:arm_mode-request instead.")))

(cl:ensure-generic-function 'ra-val :lambda-list '(m))
(cl:defmethod ra-val ((m <arm_mode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:ra-val is deprecated.  Use ROS_Socket-srv:ra instead.")
  (ra m))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <arm_mode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:action-val is deprecated.  Use ROS_Socket-srv:action instead.")
  (action m))

(cl:ensure-generic-function 'grip-val :lambda-list '(m))
(cl:defmethod grip-val ((m <arm_mode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:grip-val is deprecated.  Use ROS_Socket-srv:grip instead.")
  (grip m))

(cl:ensure-generic-function 'vel-val :lambda-list '(m))
(cl:defmethod vel-val ((m <arm_mode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:vel-val is deprecated.  Use ROS_Socket-srv:vel instead.")
  (vel m))

(cl:ensure-generic-function 'both-val :lambda-list '(m))
(cl:defmethod both-val ((m <arm_mode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:both-val is deprecated.  Use ROS_Socket-srv:both instead.")
  (both m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arm_mode-request>) ostream)
  "Serializes a message object of type '<arm_mode-request>"
  (cl:let* ((signed (cl:slot-value msg 'ra)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'action)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'grip)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'vel)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'both)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arm_mode-request>) istream)
  "Deserializes a message object of type '<arm_mode-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ra) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'grip) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vel) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'both) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arm_mode-request>)))
  "Returns string type for a service object of type '<arm_mode-request>"
  "ROS_Socket/arm_modeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_mode-request)))
  "Returns string type for a service object of type 'arm_mode-request"
  "ROS_Socket/arm_modeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arm_mode-request>)))
  "Returns md5sum for a message object of type '<arm_mode-request>"
  "b362365c058a7d0b0b5500677cb1d63b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arm_mode-request)))
  "Returns md5sum for a message object of type 'arm_mode-request"
  "b362365c058a7d0b0b5500677cb1d63b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arm_mode-request>)))
  "Returns full string definition for message of type '<arm_mode-request>"
  (cl:format cl:nil "int32 ra~%int32 action~%int32 grip~%int32 vel~%int32 both~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arm_mode-request)))
  "Returns full string definition for message of type 'arm_mode-request"
  (cl:format cl:nil "int32 ra~%int32 action~%int32 grip~%int32 vel~%int32 both~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arm_mode-request>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arm_mode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'arm_mode-request
    (cl:cons ':ra (ra msg))
    (cl:cons ':action (action msg))
    (cl:cons ':grip (grip msg))
    (cl:cons ':vel (vel msg))
    (cl:cons ':both (both msg))
))
;//! \htmlinclude arm_mode-response.msg.html

(cl:defclass <arm_mode-response> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0))
)

(cl:defclass arm_mode-response (<arm_mode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arm_mode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arm_mode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-srv:<arm_mode-response> is deprecated: use ROS_Socket-srv:arm_mode-response instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <arm_mode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:mode-val is deprecated.  Use ROS_Socket-srv:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arm_mode-response>) ostream)
  "Serializes a message object of type '<arm_mode-response>"
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arm_mode-response>) istream)
  "Deserializes a message object of type '<arm_mode-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arm_mode-response>)))
  "Returns string type for a service object of type '<arm_mode-response>"
  "ROS_Socket/arm_modeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_mode-response)))
  "Returns string type for a service object of type 'arm_mode-response"
  "ROS_Socket/arm_modeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arm_mode-response>)))
  "Returns md5sum for a message object of type '<arm_mode-response>"
  "b362365c058a7d0b0b5500677cb1d63b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arm_mode-response)))
  "Returns md5sum for a message object of type 'arm_mode-response"
  "b362365c058a7d0b0b5500677cb1d63b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arm_mode-response>)))
  "Returns full string definition for message of type '<arm_mode-response>"
  (cl:format cl:nil "int32 mode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arm_mode-response)))
  "Returns full string definition for message of type 'arm_mode-response"
  (cl:format cl:nil "int32 mode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arm_mode-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arm_mode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'arm_mode-response
    (cl:cons ':mode (mode msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'arm_mode)))
  'arm_mode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'arm_mode)))
  'arm_mode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_mode)))
  "Returns string type for a service object of type '<arm_mode>"
  "ROS_Socket/arm_mode")