; Auto-generated. Do not edit!


(cl:in-package ROS_Socket-msg)


;//! \htmlinclude ros_cmd.msg.html

(cl:defclass <ros_cmd> (roslisp-msg-protocol:ros-message)
  ((Arm_State_feedback
    :reader Arm_State_feedback
    :initarg :Arm_State_feedback
    :type cl:integer
    :initform 0))
)

(cl:defclass ros_cmd (<ros_cmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ros_cmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ros_cmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ROS_Socket-msg:<ros_cmd> is deprecated: use ROS_Socket-msg:ros_cmd instead.")))

(cl:ensure-generic-function 'Arm_State_feedback-val :lambda-list '(m))
(cl:defmethod Arm_State_feedback-val ((m <ros_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ROS_Socket-msg:Arm_State_feedback-val is deprecated.  Use ROS_Socket-msg:Arm_State_feedback instead.")
  (Arm_State_feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ros_cmd>) ostream)
  "Serializes a message object of type '<ros_cmd>"
  (cl:let* ((signed (cl:slot-value msg 'Arm_State_feedback)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ros_cmd>) istream)
  "Deserializes a message object of type '<ros_cmd>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Arm_State_feedback) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ros_cmd>)))
  "Returns string type for a message object of type '<ros_cmd>"
  "ROS_Socket/ros_cmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ros_cmd)))
  "Returns string type for a message object of type 'ros_cmd"
  "ROS_Socket/ros_cmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ros_cmd>)))
  "Returns md5sum for a message object of type '<ros_cmd>"
  "2b5d469cbc8bdcbdfd4b75c0d0da98bb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ros_cmd)))
  "Returns md5sum for a message object of type 'ros_cmd"
  "2b5d469cbc8bdcbdfd4b75c0d0da98bb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ros_cmd>)))
  "Returns full string definition for message of type '<ros_cmd>"
  (cl:format cl:nil "int32 Arm_State_feedback~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ros_cmd)))
  "Returns full string definition for message of type 'ros_cmd"
  (cl:format cl:nil "int32 Arm_State_feedback~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ros_cmd>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ros_cmd>))
  "Converts a ROS message object to a list"
  (cl:list 'ros_cmd
    (cl:cons ':Arm_State_feedback (Arm_State_feedback msg))
))
