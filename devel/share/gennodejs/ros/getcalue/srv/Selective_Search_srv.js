// Auto-generated. Do not edit!

// (in-package getcalue.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class Selective_Search_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input = null;
    }
    else {
      if (initObj.hasOwnProperty('input')) {
        this.input = initObj.input
      }
      else {
        this.input = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Selective_Search_srvRequest
    // Serialize message field [input]
    bufferOffset = _serializer.int64(obj.input, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Selective_Search_srvRequest
    let len;
    let data = new Selective_Search_srvRequest(null);
    // Deserialize message field [input]
    data.input = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'getcalue/Selective_Search_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'efb1911a9ea9163151d70e4586fa0801';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 input
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Selective_Search_srvRequest(null);
    if (msg.input !== undefined) {
      resolved.input = msg.input;
    }
    else {
      resolved.input = 0
    }

    return resolved;
    }
};

class Selective_Search_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.w = null;
      this.h = null;
      this.depth = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('w')) {
        this.w = initObj.w
      }
      else {
        this.w = 0.0;
      }
      if (initObj.hasOwnProperty('h')) {
        this.h = initObj.h
      }
      else {
        this.h = 0.0;
      }
      if (initObj.hasOwnProperty('depth')) {
        this.depth = initObj.depth
      }
      else {
        this.depth = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Selective_Search_srvResponse
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float32(obj.y, buffer, bufferOffset);
    // Serialize message field [w]
    bufferOffset = _serializer.float32(obj.w, buffer, bufferOffset);
    // Serialize message field [h]
    bufferOffset = _serializer.float32(obj.h, buffer, bufferOffset);
    // Serialize message field [depth]
    bufferOffset = _serializer.float32(obj.depth, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Selective_Search_srvResponse
    let len;
    let data = new Selective_Search_srvResponse(null);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [w]
    data.w = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [h]
    data.h = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [depth]
    data.depth = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'getcalue/Selective_Search_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ce212d18c694b98ebe7f905c8e5ab43f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 x
    float32 y
    float32 w
    float32 h
    float32 depth
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Selective_Search_srvResponse(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.w !== undefined) {
      resolved.w = msg.w;
    }
    else {
      resolved.w = 0.0
    }

    if (msg.h !== undefined) {
      resolved.h = msg.h;
    }
    else {
      resolved.h = 0.0
    }

    if (msg.depth !== undefined) {
      resolved.depth = msg.depth;
    }
    else {
      resolved.depth = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: Selective_Search_srvRequest,
  Response: Selective_Search_srvResponse,
  md5sum() { return '18c14c3bda66d95b24244dd6b7b2ba3f'; },
  datatype() { return 'getcalue/Selective_Search_srv'; }
};
