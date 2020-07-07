; Auto-generated. Do not edit!


(cl:in-package ROS_Socket-srv)


;//! \htmlinclude arm_state-request.msg.html

(cl:defclass <arm_state-request> (roslisp-msg-protocol:ros-message)
  ((Arm_state
    :reader Arm_state
    :initarg :Arm_state
    :type cl:integer
    :initform 0))
)

(cl:defclass arm_state-request (<arm_state-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arm_state-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arm_state-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-srv:<arm_state-request> is deprecated: use ROS_Socket-srv:arm_state-request instead.")))

(cl:ensure-generic-function 'Arm_state-val :lambda-list '(m))
(cl:defmethod Arm_state-val ((m <arm_state-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:Arm_state-val is deprecated.  Use ROS_Socket-srv:Arm_state instead.")
  (Arm_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arm_state-request>) ostream)
  "Serializes a message object of type '<arm_state-request>"
  (cl:let* ((signed (cl:slot-value msg 'Arm_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arm_state-request>) istream)
  "Deserializes a message object of type '<arm_state-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Arm_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arm_state-request>)))
  "Returns string type for a service object of type '<arm_state-request>"
  "ROS_Socket/arm_stateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_state-request)))
  "Returns string type for a service object of type 'arm_state-request"
  "ROS_Socket/arm_stateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arm_state-request>)))
  "Returns md5sum for a message object of type '<arm_state-request>"
  "9a18ae858978714c254ecb02ef2924b7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arm_state-request)))
  "Returns md5sum for a message object of type 'arm_state-request"
  "9a18ae858978714c254ecb02ef2924b7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arm_state-request>)))
  "Returns full string definition for message of type '<arm_state-request>"
  (cl:format cl:nil "int32 Arm_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arm_state-request)))
  "Returns full string definition for message of type 'arm_state-request"
  (cl:format cl:nil "int32 Arm_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arm_state-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arm_state-request>))
  "Converts a ROS message object to a list"
  (cl:list 'arm_state-request
    (cl:cons ':Arm_state (Arm_state msg))
))
;//! \htmlinclude arm_state-response.msg.html

(cl:defclass <arm_state-response> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:integer
    :initform 0))
)

(cl:defclass arm_state-response (<arm_state-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arm_state-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arm_state-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-srv:<arm_state-response> is deprecated: use ROS_Socket-srv:arm_state-response instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <arm_state-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-srv:state-val is deprecated.  Use ROS_Socket-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arm_state-response>) ostream)
  "Serializes a message object of type '<arm_state-response>"
  (cl:let* ((signed (cl:slot-value msg 'state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arm_state-response>) istream)
  "Deserializes a message object of type '<arm_state-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arm_state-response>)))
  "Returns string type for a service object of type '<arm_state-response>"
  "ROS_Socket/arm_stateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_state-response)))
  "Returns string type for a service object of type 'arm_state-response"
  "ROS_Socket/arm_stateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arm_state-response>)))
  "Returns md5sum for a message object of type '<arm_state-response>"
  "9a18ae858978714c254ecb02ef2924b7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arm_state-response)))
  "Returns md5sum for a message object of type 'arm_state-response"
  "9a18ae858978714c254ecb02ef2924b7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arm_state-response>)))
  "Returns full string definition for message of type '<arm_state-response>"
  (cl:format cl:nil "int32 state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arm_state-response)))
  "Returns full string definition for message of type 'arm_state-response"
  (cl:format cl:nil "int32 state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arm_state-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arm_state-response>))
  "Converts a ROS message object to a list"
  (cl:list 'arm_state-response
    (cl:cons ':state (state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'arm_state)))
  'arm_state-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'arm_state)))
  'arm_state-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_state)))
  "Returns string type for a service object of type '<arm_state>"
  "ROS_Socket/arm_state")