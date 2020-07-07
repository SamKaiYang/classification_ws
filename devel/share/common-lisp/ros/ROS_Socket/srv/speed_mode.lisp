; Auto-generated. Do not edit!


(cl:in-package ROS_Socket-srv)


;//! \htmlinclude speed_mode-request.msg.html

(cl:defclass <speed_mode-request> (roslisp-msg-protocol:ros-message)
  ((Speedmode
    :reader Speedmode
    :initarg :Speedmode
    :type cl:integer
    :initform 0))
)

(cl:defclass speed_mode-request (<speed_mode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <speed_mode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'speed_mode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-srv:<speed_mode-request> is deprecated: use ROS_Socket-srv:speed_mode-request instead.")))

(cl:ensure-generic-function 'Speedmode-val :lambda-list '(m))
(cl:defmethod Speedmode-val ((m <speed_mode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:Speedmode-val is deprecated.  Use ROS_Socket-srv:Speedmode instead.")
  (Speedmode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <speed_mode-request>) ostream)
  "Serializes a message object of type '<speed_mode-request>"
  (cl:let* ((signed (cl:slot-value msg 'Speedmode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <speed_mode-request>) istream)
  "Deserializes a message object of type '<speed_mode-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Speedmode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<speed_mode-request>)))
  "Returns string type for a service object of type '<speed_mode-request>"
  "ROS_Socket/speed_modeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'speed_mode-request)))
  "Returns string type for a service object of type 'speed_mode-request"
  "ROS_Socket/speed_modeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<speed_mode-request>)))
  "Returns md5sum for a message object of type '<speed_mode-request>"
  "71efcf49fabc95bebfd108417405a10f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'speed_mode-request)))
  "Returns md5sum for a message object of type 'speed_mode-request"
  "71efcf49fabc95bebfd108417405a10f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<speed_mode-request>)))
  "Returns full string definition for message of type '<speed_mode-request>"
  (cl:format cl:nil "int32 Speedmode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'speed_mode-request)))
  "Returns full string definition for message of type 'speed_mode-request"
  (cl:format cl:nil "int32 Speedmode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <speed_mode-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <speed_mode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'speed_mode-request
    (cl:cons ':Speedmode (Speedmode msg))
))
;//! \htmlinclude speed_mode-response.msg.html

(cl:defclass <speed_mode-response> (roslisp-msg-protocol:ros-message)
  ((feedback
    :reader feedback
    :initarg :feedback
    :type cl:integer
    :initform 0))
)

(cl:defclass speed_mode-response (<speed_mode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <speed_mode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'speed_mode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-srv:<speed_mode-response> is deprecated: use ROS_Socket-srv:speed_mode-response instead.")))

(cl:ensure-generic-function 'feedback-val :lambda-list '(m))
(cl:defmethod feedback-val ((m <speed_mode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:feedback-val is deprecated.  Use ROS_Socket-srv:feedback instead.")
  (feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <speed_mode-response>) ostream)
  "Serializes a message object of type '<speed_mode-response>"
  (cl:let* ((signed (cl:slot-value msg 'feedback)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <speed_mode-response>) istream)
  "Deserializes a message object of type '<speed_mode-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'feedback) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<speed_mode-response>)))
  "Returns string type for a service object of type '<speed_mode-response>"
  "ROS_Socket/speed_modeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'speed_mode-response)))
  "Returns string type for a service object of type 'speed_mode-response"
  "ROS_Socket/speed_modeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<speed_mode-response>)))
  "Returns md5sum for a message object of type '<speed_mode-response>"
  "71efcf49fabc95bebfd108417405a10f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'speed_mode-response)))
  "Returns md5sum for a message object of type 'speed_mode-response"
  "71efcf49fabc95bebfd108417405a10f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<speed_mode-response>)))
  "Returns full string definition for message of type '<speed_mode-response>"
  (cl:format cl:nil "int32 feedback~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'speed_mode-response)))
  "Returns full string definition for message of type 'speed_mode-response"
  (cl:format cl:nil "int32 feedback~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <speed_mode-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <speed_mode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'speed_mode-response
    (cl:cons ':feedback (feedback msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'speed_mode)))
  'speed_mode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'speed_mode)))
  'speed_mode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'speed_mode)))
  "Returns string type for a service object of type '<speed_mode>"
  "ROS_Socket/speed_mode")