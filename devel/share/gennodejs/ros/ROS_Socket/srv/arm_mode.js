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

class arm_modeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ra = null;
      this.action = null;
      this.grip = null;
      this.vel = null;
      this.both = null;
    }
    else {
      if (initObj.hasOwnProperty('ra')) {
        this.ra = initObj.ra
      }
      else {
        this.ra = 0;
      }
      if (initObj.hasOwnProperty('action')) {
        this.action = initObj.action
      }
      else {
        this.action = 0;
      }
      if (initObj.hasOwnProperty('grip')) {
        this.grip = initObj.grip
      }
      else {
        this.grip = 0;
      }
      if (initObj.hasOwnProperty('vel')) {
        this.vel = initObj.vel
      }
      else {
        this.vel = 0;
      }
      if (initObj.hasOwnProperty('both')) {
        this.both = initObj.both
      }
      else {
        this.both = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type arm_modeRequest
    // Serialize message field [ra]
    bufferOffset = _serializer.int32(obj.ra, buffer, bufferOffset);
    // Serialize message field [action]
    bufferOffset = _serializer.int32(obj.action, buffer, bufferOffset);
    // Serialize message field [grip]
    bufferOffset = _serializer.int32(obj.grip, buffer, bufferOffset);
    // Serialize message field [vel]
    bufferOffset = _serializer.int32(obj.vel, buffer, bufferOffset);
    // Serialize message field [both]
    bufferOffset = _serializer.int32(obj.both, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type arm_modeRequest
    let len;
    let data = new arm_modeRequest(null);
    // Deserialize message field [ra]
    data.ra = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [action]
    data.action = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [grip]
    data.grip = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [vel]
    data.vel = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [both]
    data.both = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ROS_Socket/arm_modeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '14e7cc440862055b616759a22dacdd36';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 ra
    int32 action
    int32 grip
    int32 vel
    int32 both
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new arm_modeRequest(null);
    if (msg.ra !== undefined) {
      resolved.ra = msg.ra;
    }
    else {
      resolved.ra = 0
    }

    if (msg.action !== undefined) {
      resolved.action = msg.action;
    }
    else {
      resolved.action = 0
    }

    if (msg.grip !== undefined) {
      resolved.grip = msg.grip;
    }
    else {
      resolved.grip = 0
    }

    if (msg.vel !== undefined) {
      resolved.vel = msg.vel;
    }
    else {
      resolved.vel = 0
    }

    if (msg.both !== undefined) {
      resolved.both = msg.both;
    }
    else {
      resolved.both = 0
    }

    return resolved;
    }
};

class arm_modeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mode = null;
    }
    else {
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type arm_modeResponse
    // Serialize message field [mode]
    bufferOffset = _serializer.int32(obj.mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type arm_modeResponse
    let len;
    let data = new arm_modeResponse(null);
    // Deserialize message field [mode]
    data.mode = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ROS_Socket/arm_modeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ff63f6ea3c3e9b7504b2cb3ee0a09d92';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 mode
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new arm_modeResponse(null);
    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: arm_modeRequest,
  Response: arm_modeResponse,
  md5sum() { return 'b362365c058a7d0b0b5500677cb1d63b'; },
  datatype() { return 'ROS_Socket/arm_mode'; }
};
