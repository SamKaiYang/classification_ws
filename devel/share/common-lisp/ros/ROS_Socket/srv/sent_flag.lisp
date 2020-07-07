; Auto-generated. Do not edit!


(cl:in-package ROS_Socket-srv)


;//! \htmlinclude sent_flag-request.msg.html

(cl:defclass <sent_flag-request> (roslisp-msg-protocol:ros-message)
  ((sent_flag
    :reader sent_flag
    :initarg :sent_flag
    :type cl:integer
    :initform 0))
)

(cl:defclass sent_flag-request (<sent_flag-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sent_flag-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sent_flag-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-srv:<sent_flag-request> is deprecated: use ROS_Socket-srv:sent_flag-request instead.")))

(cl:ensure-generic-function 'sent_flag-val :lambda-list '(m))
(cl:defmethod sent_flag-val ((m <sent_flag-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:sent_flag-val is deprecated.  Use ROS_Socket-srv:sent_flag instead.")
  (sent_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sent_flag-request>) ostream)
  "Serializes a message object of type '<sent_flag-request>"
  (cl:let* ((signed (cl:slot-value msg 'sent_flag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sent_flag-request>) istream)
  "Deserializes a message object of type '<sent_flag-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sent_flag) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sent_flag-request>)))
  "Returns string type for a service object of type '<sent_flag-request>"
  "ROS_Socket/sent_flagRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sent_flag-request)))
  "Returns string type for a service object of type 'sent_flag-request"
  "ROS_Socket/sent_flagRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sent_flag-request>)))
  "Returns md5sum for a message object of type '<sent_flag-request>"
  "6e5879da81627af41fb741e0047f9b21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sent_flag-request)))
  "Returns md5sum for a message object of type 'sent_flag-request"
  "6e5879da81627af41fb741e0047f9b21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sent_flag-request>)))
  "Returns full string definition for message of type '<sent_flag-request>"
  (cl:format cl:nil "int32 sent_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sent_flag-request)))
  "Returns full string definition for message of type 'sent_flag-request"
  (cl:format cl:nil "int32 sent_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sent_flag-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sent_flag-request>))
  "Converts a ROS message object to a list"
  (cl:list 'sent_flag-request
    (cl:cons ':sent_flag (sent_flag msg))
))
;//! \htmlinclude sent_flag-response.msg.html

(cl:defclass <sent_flag-response> (roslisp-msg-protocol:ros-message)
  ((sent_flag_feedback
    :reader sent_flag_feedback
    :initarg :sent_flag_feedback
    :type cl:integer
    :initform 0))
)

(cl:defclass sent_flag-response (<sent_flag-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sent_flag-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sent_flag-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-srv:<sent_flag-response> is deprecated: use ROS_Socket-srv:sent_flag-response instead.")))

(cl:ensure-generic-function 'sent_flag_feedback-val :lambda-list '(m))
(cl:defmethod sent_flag_feedback-val ((m <sent_flag-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:sent_flag_feedback-val is deprecated.  Use ROS_Socket-srv:sent_flag_feedback instead.")
  (sent_flag_feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sent_flag-response>) ostream)
  "Serializes a message object of type '<sent_flag-response>"
  (cl:let* ((signed (cl:slot-value msg 'sent_flag_feedback)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sent_flag-response>) istream)
  "Deserializes a message object of type '<sent_flag-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sent_flag_feedback) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sent_flag-response>)))
  "Returns string type for a service object of type '<sent_flag-response>"
  "ROS_Socket/sent_flagResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sent_flag-response)))
  "Returns string type for a service object of type 'sent_flag-response"
  "ROS_Socket/sent_flagResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sent_flag-response>)))
  "Returns md5sum for a message object of type '<sent_flag-response>"
  "6e5879da81627af41fb741e0047f9b21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sent_flag-response)))
  "Returns md5sum for a message object of type 'sent_flag-response"
  "6e5879da81627af41fb741e0047f9b21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sent_flag-response>)))
  "Returns full string definition for message of type '<sent_flag-response>"
  (cl:format cl:nil "int32 sent_flag_feedback~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sent_flag-response)))
  "Returns full string definition for message of type 'sent_flag-response"
  (cl:format cl:nil "int32 sent_flag_feedback~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sent_flag-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sent_flag-response>))
  "Converts a ROS message object to a list"
  (cl:list 'sent_flag-response
    (cl:cons ':sent_flag_feedback (sent_flag_feedback msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'sent_flag)))
  'sent_flag-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'sent_flag)))
  'sent_flag-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sent_flag)))
  "Returns string type for a service object of type '<sent_flag>"
  "ROS_Socket/sent_flag")