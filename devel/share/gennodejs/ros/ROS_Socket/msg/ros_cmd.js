// Auto-generated. Do not edit!

// (in-package ROS_Socket.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ros_cmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Arm_State_feedback = null;
    }
    else {
      if (initObj.hasOwnProperty('Arm_State_feedback')) {
        this.Arm_State_feedback = initObj.Arm_State_feedback
      }
      else {
        this.Arm_State_feedback = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ros_cmd
    // Serialize message field [Arm_State_feedback]
    bufferOffset = _serializer.int32(obj.Arm_State_feedback, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ros_cmd
    let len;
    let data = new ros_cmd(null);
    // Deserialize message field [Arm_State_feedback]
    data.Arm_State_feedback = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ROS_Socket/ros_cmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2b5d469cbc8bdcbdfd4b75c0d0da98bb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 Arm_State_feedback
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ros_cmd(null);
    if (msg.Arm_State_feedback !== undefined) {
      resolved.Arm_State_feedback = msg.Arm_State_feedback;
    }
    else {
      resolved.Arm_State_feedback = 0
    }

    return resolved;
    }
};

module.exports = ros_cmd;
