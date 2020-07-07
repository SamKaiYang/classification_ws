// Auto-generated. Do not edit!

// (in-package ROS_Socket.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class sent_flagRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sent_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('sent_flag')) {
        this.sent_flag = initObj.sent_flag
      }
      else {
        this.sent_flag = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sent_flagRequest
    // Serialize message field [sent_flag]
    bufferOffset = _serializer.int32(obj.sent_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sent_flagRequest
    let len;
    let data = new sent_flagRequest(null);
    // Deserialize message field [sent_flag]
    data.sent_flag = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ROS_Socket/sent_flagRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '39e05f3ce9098d0387c45debbe323a10';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 sent_flag
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sent_flagRequest(null);
    if (msg.sent_flag !== undefined) {
      resolved.sent_flag = msg.sent_flag;
    }
    else {
      resolved.sent_flag = 0
    }

    return resolved;
    }
};

class sent_flagResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sent_flag_feedback = null;
    }
    else {
      if (initObj.hasOwnProperty('sent_flag_feedback')) {
        this.sent_flag_feedback = initObj.sent_flag_feedback
      }
      else {
        this.sent_flag_feedback = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sent_flagResponse
    // Serialize message field [sent_flag_feedback]
    bufferOffset = _serializer.int32(obj.sent_flag_feedback, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sent_flagResponse
    let len;
    let data = new sent_flagResponse(null);
    // Deserialize message field [sent_flag_feedback]
    data.sent_flag_feedback = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ROS_Socket/sent_flagResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5b8c58d190b336cb3e72a77db8ef8d99';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 sent_flag_feedback
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sent_flagResponse(null);
    if (msg.sent_flag_feedback !== undefined) {
      resolved.sent_flag_feedback = msg.sent_flag_feedback;
    }
    else {
      resolved.sent_flag_feedback = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: sent_flagRequest,
  Response: sent_flagResponse,
  md5sum() { return '6e5879da81627af41fb741e0047f9b21'; },
  datatype() { return 'ROS_Socket/sent_flag'; }
};
