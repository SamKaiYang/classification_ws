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

class ROI {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.object_name = null;
      this.score = null;
      this.min_x = null;
      this.Max_x = null;
      this.min_y = null;
      this.Max_y = null;
    }
    else {
      if (initObj.hasOwnProperty('object_name')) {
        this.object_name = initObj.object_name
      }
      else {
        this.object_name = '';
      }
      if (initObj.hasOwnProperty('score')) {
        this.score = initObj.score
      }
      else {
        this.score = 0.0;
      }
      if (initObj.hasOwnProperty('min_x')) {
        this.min_x = initObj.min_x
      }
      else {
        this.min_x = 0;
      }
      if (initObj.hasOwnProperty('Max_x')) {
        this.Max_x = initObj.Max_x
      }
      else {
        this.Max_x = 0;
      }
      if (initObj.hasOwnProperty('min_y')) {
        this.min_y = initObj.min_y
      }
      else {
        this.min_y = 0;
      }
      if (initObj.hasOwnProperty('Max_y')) {
        this.Max_y = initObj.Max_y
      }
      else {
        this.Max_y = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ROI
    // Serialize message field [object_name]
    bufferOffset = _serializer.string(obj.object_name, buffer, bufferOffset);
    // Serialize message field [score]
    bufferOffset = _serializer.float32(obj.score, buffer, bufferOffset);
    // Serialize message field [min_x]
    bufferOffset = _serializer.int32(obj.min_x, buffer, bufferOffset);
    // Serialize message field [Max_x]
    bufferOffset = _serializer.int32(obj.Max_x, buffer, bufferOffset);
    // Serialize message field [min_y]
    bufferOffset = _serializer.int32(obj.min_y, buffer, bufferOffset);
    // Serialize message field [Max_y]
    bufferOffset = _serializer.int32(obj.Max_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ROI
    let len;
    let data = new ROI(null);
    // Deserialize message field [object_name]
    data.object_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [score]
    data.score = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [min_x]
    data.min_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Max_x]
    data.Max_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [min_y]
    data.min_y = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Max_y]
    data.Max_y = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.object_name.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ROS_Socket/ROI';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '94c6de870ee9725e733216fafc995b64';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string object_name
    float32 score
    int32 min_x
    int32 Max_x
    int32 min_y
    int32 Max_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ROI(null);
    if (msg.object_name !== undefined) {
      resolved.object_name = msg.object_name;
    }
    else {
      resolved.object_name = ''
    }

    if (msg.score !== undefined) {
      resolved.score = msg.score;
    }
    else {
      resolved.score = 0.0
    }

    if (msg.min_x !== undefined) {
      resolved.min_x = msg.min_x;
    }
    else {
      resolved.min_x = 0
    }

    if (msg.Max_x !== undefined) {
      resolved.Max_x = msg.Max_x;
    }
    else {
      resolved.Max_x = 0
    }

    if (msg.min_y !== undefined) {
      resolved.min_y = msg.min_y;
    }
    else {
      resolved.min_y = 0
    }

    if (msg.Max_y !== undefined) {
      resolved.Max_y = msg.Max_y;
    }
    else {
      resolved.Max_y = 0
    }

    return resolved;
    }
};

module.exports = ROI;
