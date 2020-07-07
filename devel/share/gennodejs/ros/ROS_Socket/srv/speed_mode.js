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

class speed_modeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Speedmode = null;
    }
    else {
      if (initObj.hasOwnProperty('Speedmode')) {
        this.Speedmode = initObj.Speedmode
      }
      else {
        this.Speedmode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type speed_modeRequest
    // Serialize message field [Speedmode]
    bufferOffset = _serializer.int32(obj.Speedmode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type speed_modeRequest
    let len;
    let data = new speed_modeRequest(null);
    // Deserialize message field [Speedmode]
    data.Speedmode = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ROS_Socket/speed_modeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd6d28e9e131c44e0129780d170036ce7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 Speedmode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new speed_modeRequest(null);
    if (msg.Speedmode !== undefined) {
      resolved.Speedmode = msg.Speedmode;
    }
    else {
      resolved.Speedmode = 0
    }

    return resolved;
    }
};

class speed_modeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.feedback = null;
    }
    else {
      if (initObj.hasOwnProperty('feedback')) {
        this.feedback = initObj.feedback
      }
      else {
        this.feedback = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type speed_modeResponse
    // Serialize message field [feedback]
    bufferOffset = _serializer.int32(obj.feedback, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type speed_modeResponse
    let len;
    let data = new speed_modeResponse(null);
    // Deserialize message field [feedback]
    data.feedback = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ROS_Socket/speed_modeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '49ceb5b32ea3af22073ede4a0328249e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 feedback
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new speed_modeResponse(null);
    if (msg.feedback !== undefined) {
      resolved.feedback = msg.feedback;
    }
    else {
      resolved.feedback = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: speed_modeRequest,
  Response: speed_modeResponse,
  md5sum() { return '71efcf49fabc95bebfd108417405a10f'; },
  datatype() { return 'ROS_Socket/speed_mode'; }
};
