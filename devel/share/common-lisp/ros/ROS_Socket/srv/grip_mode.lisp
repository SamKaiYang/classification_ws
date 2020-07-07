; Auto-generated. Do not edit!


(cl:in-package ROS_Socket-srv)


;//! \htmlinclude grip_mode-request.msg.html

(cl:defclass <grip_mode-request> (roslisp-msg-protocol:ros-message)
  ((grip
    :reader grip
    :initarg :grip
    :type cl:integer
    :initform 0))
)

(cl:defclass grip_mode-request (<grip_mode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <grip_mode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'grip_mode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-srv:<grip_mode-request> is deprecated: use ROS_Socket-srv:grip_mode-request instead.")))

(cl:ensure-generic-function 'grip-val :lambda-list '(m))
(cl:defmethod grip-val ((m <grip_mode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:grip-val is deprecated.  Use ROS_Socket-srv:grip instead.")
  (grip m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <grip_mode-request>) ostream)
  "Serializes a message object of type '<grip_mode-request>"
  (cl:let* ((signed (cl:slot-value msg 'grip)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <grip_mode-request>) istream)
  "Deserializes a message object of type '<grip_mode-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'grip) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<grip_mode-request>)))
  "Returns string type for a service object of type '<grip_mode-request>"
  "ROS_Socket/grip_modeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'grip_mode-request)))
  "Returns string type for a service object of type 'grip_mode-request"
  "ROS_Socket/grip_modeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<grip_mode-request>)))
  "Returns md5sum for a message object of type '<grip_mode-request>"
  "d92a2d9da83c00d7d8de417445c123ec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'grip_mode-request)))
  "Returns md5sum for a message object of type 'grip_mode-request"
  "d92a2d9da83c00d7d8de417445c123ec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<grip_mode-request>)))
  "Returns full string definition for message of type '<grip_mode-request>"
  (cl:format cl:nil "int32 grip~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'grip_mode-request)))
  "Returns full string definition for message of type 'grip_mode-request"
  (cl:format cl:nil "int32 grip~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <grip_mode-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <grip_mode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'grip_mode-request
    (cl:cons ':grip (grip msg))
))
;//! \htmlinclude grip_mode-response.msg.html

(cl:defclass <grip_mode-response> (roslisp-msg-protocol:ros-message)
  ((grip_feedback
    :reader grip_feedback
    :initarg :grip_feedback
    :type cl:integer
    :initform 0))
)

(cl:defclass grip_mode-response (<grip_mode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <grip_mode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'grip_mode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-srv:<grip_mode-response> is deprecated: use ROS_Socket-srv:grip_mode-response instead.")))

(cl:ensure-generic-function 'grip_feedback-val :lambda-list '(m))
(cl:defmethod grip_feedback-val ((m <grip_mode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:grip_feedback-val is deprecated.  Use ROS_Socket-srv:grip_feedback instead.")
  (grip_feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <grip_mode-response>) ostream)
  "Serializes a message object of type '<grip_mode-response>"
  (cl:let* ((signed (cl:slot-value msg 'grip_feedback)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <grip_mode-response>) istream)
  "Deserializes a message object of type '<grip_mode-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'grip_feedback) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<grip_mode-response>)))
  "Returns string type for a service object of type '<grip_mode-response>"
  "ROS_Socket/grip_modeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'grip_mode-response)))
  "Returns string type for a service object of type 'grip_mode-response"
  "ROS_Socket/grip_modeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<grip_mode-response>)))
  "Returns md5sum for a message object of type '<grip_mode-response>"
  "d92a2d9da83c00d7d8de417445c123ec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'grip_mode-response)))
  "Returns md5sum for a message object of type 'grip_mode-response"
  "d92a2d9da83c00d7d8de417445c123ec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<grip_mode-response>)))
  "Returns full string definition for message of type '<grip_mode-response>"
  (cl:format cl:nil "int32 grip_feedback~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'grip_mode-response)))
  "Returns full string definition for message of type 'grip_mode-response"
  (cl:format cl:nil "int32 grip_feedback~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <grip_mode-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <grip_mode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'grip_mode-response
    (cl:cons ':grip_feedback (grip_feedback msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'grip_mode)))
  'grip_mode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'grip_mode)))
  'grip_mode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'grip_mode)))
  "Returns string type for a service object of type '<grip_mode>"
  "ROS_Socket/grip_mode")