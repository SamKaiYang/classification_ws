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

class arm_stateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Arm_state = null;
    }
    else {
      if (initObj.hasOwnProperty('Arm_state')) {
        this.Arm_state = initObj.Arm_state
      }
      else {
        this.Arm_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type arm_stateRequest
    // Serialize message field [Arm_state]
    bufferOffset = _serializer.int32(obj.Arm_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type arm_stateRequest
    let len;
    let data = new arm_stateRequest(null);
    // Deserialize message field [Arm_state]
    data.Arm_state = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ROS_Socket/arm_stateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6f8852739838bec3a3ae498184753087';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 Arm_state
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new arm_stateRequest(null);
    if (msg.Arm_state !== undefined) {
      resolved.Arm_state = msg.Arm_state;
    }
    else {
      resolved.Arm_state = 0
    }

    return resolved;
    }
};

class arm_stateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type arm_stateResponse
    // Serialize message field [state]
    bufferOffset = _serializer.int32(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type arm_stateResponse
    let len;
    let data = new arm_stateResponse(null);
    // Deserialize message field [state]
    data.state = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ROS_Socket/arm_stateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7a2f37ef2ba405f0c7a15cc72663d6f0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 state
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new arm_stateResponse(null);
    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: arm_stateRequest,
  Response: arm_stateResponse,
  md5sum() { return '9a18ae858978714c254ecb02ef2924b7'; },
  datatype() { return 'ROS_Socket/arm_state'; }
};
