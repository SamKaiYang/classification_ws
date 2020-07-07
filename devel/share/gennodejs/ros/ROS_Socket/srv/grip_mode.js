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

class grip_modeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.grip = null;
    }
    else {
      if (initObj.hasOwnProperty('grip')) {
        this.grip = initObj.grip
      }
      else {
        this.grip = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type grip_modeRequest
    // Serialize message field [grip]
    bufferOffset = _serializer.int32(obj.grip, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type grip_modeRequest
    let len;
    let data = new grip_modeRequest(null);
    // Deserialize message field [grip]
    data.grip = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ROS_Socket/grip_modeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fde367d31e32259b71ef32c4b90a9d2b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 grip
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new grip_modeRequest(null);
    if (msg.grip !== undefined) {
      resolved.grip = msg.grip;
    }
    else {
      resolved.grip = 0
    }

    return resolved;
    }
};

class grip_modeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.grip_feedback = null;
    }
    else {
      if (initObj.hasOwnProperty('grip_feedback')) {
        this.grip_feedback = initObj.grip_feedback
      }
      else {
        this.grip_feedback = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type grip_modeResponse
    // Serialize message field [grip_feedback]
    bufferOffset = _serializer.int32(obj.grip_feedback, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type grip_modeResponse
    let len;
    let data = new grip_modeResponse(null);
    // Deserialize message field [grip_feedback]
    data.grip_feedback = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ROS_Socket/grip_modeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bd85edbf9714b6716896d2eb254e1e0d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 grip_feedback
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new grip_modeResponse(null);
    if (msg.grip_feedback !== undefined) {
      resolved.grip_feedback = msg.grip_feedback;
    }
    else {
      resolved.grip_feedback = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: grip_modeRequest,
  Response: grip_modeResponse,
  md5sum() { return 'd92a2d9da83c00d7d8de417445c123ec'; },
  datatype() { return 'ROS_Socket/grip_mode'; }
};
