# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from wfov_camera_msgs/WFOVImage.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import sensor_msgs.msg
import std_msgs.msg

class WFOVImage(genpy.Message):
  _md5sum = "807d0db423ab5e1561cfeba09a10bc88"
  _type = "wfov_camera_msgs/WFOVImage"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """# Message for holding an image and metadata for the NDVI cameras.
Header header			# stamp is the time at which the data was valid.
				# frame_id is the location of the camera.

string time_reference		# The name of the reference clock for this message's timestamp.

sensor_msgs/Image image      	# Standard ROS image

sensor_msgs/CameraInfo info  	# Standard ROS camera info

float32 shutter              	# Time duration (seconds) the shutter was open.  Given by the FPGA timesync packet.  Negative shutter is an uninitialized (invalid) value.

float32 gain		     	# Gain (in dB) applied to the image.

uint16 white_balance_blue    	# White balance in blue.

uint16 white_balance_red     	# White balance in red.

float32 temperature          	# Temperature reported by the camera (Celsius).
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: sensor_msgs/CameraInfo
# This message defines meta information for a camera. It should be in a
# camera namespace on topic "camera_info" and accompanied by up to five
# image topics named:
#
#   image_raw - raw data from the camera driver, possibly Bayer encoded
#   image            - monochrome, distorted
#   image_color      - color, distorted
#   image_rect       - monochrome, rectified
#   image_rect_color - color, rectified
#
# The image_pipeline contains packages (image_proc, stereo_image_proc)
# for producing the four processed image topics from image_raw and
# camera_info. The meaning of the camera parameters are described in
# detail at http://www.ros.org/wiki/image_pipeline/CameraInfo.
#
# The image_geometry package provides a user-friendly interface to
# common operations using this meta information. If you want to, e.g.,
# project a 3d point into image coordinates, we strongly recommend
# using image_geometry.
#
# If the camera is uncalibrated, the matrices D, K, R, P should be left
# zeroed out. In particular, clients may assume that K[0] == 0.0
# indicates an uncalibrated camera.

#######################################################################
#                     Image acquisition info                          #
#######################################################################

# Time of image acquisition, camera coordinate frame ID
Header header    # Header timestamp should be acquisition time of image
                 # Header frame_id should be optical frame of camera
                 # origin of frame should be optical center of camera
                 # +x should point to the right in the image
                 # +y should point down in the image
                 # +z should point into the plane of the image


#######################################################################
#                      Calibration Parameters                         #
#######################################################################
# These are fixed during camera calibration. Their values will be the #
# same in all messages until the camera is recalibrated. Note that    #
# self-calibrating systems may "recalibrate" frequently.              #
#                                                                     #
# The internal parameters can be used to warp a raw (distorted) image #
# to:                                                                 #
#   1. An undistorted image (requires D and K)                        #
#   2. A rectified image (requires D, K, R)                           #
# The projection matrix P projects 3D points into the rectified image.#
#######################################################################

# The image dimensions with which the camera was calibrated. Normally
# this will be the full camera resolution in pixels.
uint32 height
uint32 width

# The distortion model used. Supported models are listed in
# sensor_msgs/distortion_models.h. For most cameras, "plumb_bob" - a
# simple model of radial and tangential distortion - is sufficient.
string distortion_model

# The distortion parameters, size depending on the distortion model.
# For "plumb_bob", the 5 parameters are: (k1, k2, t1, t2, k3).
float64[] D

# Intrinsic camera matrix for the raw (distorted) images.
#     [fx  0 cx]
# K = [ 0 fy cy]
#     [ 0  0  1]
# Projects 3D points in the camera coordinate frame to 2D pixel
# coordinates using the focal lengths (fx, fy) and principal point
# (cx, cy).
float64[9]  K # 3x3 row-major matrix

# Rectification matrix (stereo cameras only)
# A rotation matrix aligning the camera coordinate system to the ideal
# stereo image plane so that epipolar lines in both stereo images are
# parallel.
float64[9]  R # 3x3 row-major matrix

# Projection/camera matrix
#     [fx'  0  cx' Tx]
# P = [ 0  fy' cy' Ty]
#     [ 0   0   1   0]
# By convention, this matrix specifies the intrinsic (camera) matrix
#  of the processed (rectified) image. That is, the left 3x3 portion
#  is the normal camera intrinsic matrix for the rectified image.
# It projects 3D points in the camera coordinate frame to 2D pixel
#  coordinates using the focal lengths (fx', fy') and principal point
#  (cx', cy') - these may differ from the values in K.
# For monocular cameras, Tx = Ty = 0. Normally, monocular cameras will
#  also have R = the identity and P[1:3,1:3] = K.
# For a stereo pair, the fourth column [Tx Ty 0]' is related to the
#  position of the optical center of the second camera in the first
#  camera's frame. We assume Tz = 0 so both cameras are in the same
#  stereo image plane. The first camera always has Tx = Ty = 0. For
#  the right (second) camera of a horizontal stereo pair, Ty = 0 and
#  Tx = -fx' * B, where B is the baseline between the cameras.
# Given a 3D point [X Y Z]', the projection (x, y) of the point onto
#  the rectified image is given by:
#  [u v w]' = P * [X Y Z 1]'
#         x = u / w
#         y = v / w
#  This holds for both images of a stereo pair.
float64[12] P # 3x4 row-major matrix


#######################################################################
#                      Operational Parameters                         #
#######################################################################
# These define the image region actually captured by the camera       #
# driver. Although they affect the geometry of the output image, they #
# may be changed freely without recalibrating the camera.             #
#######################################################################

# Binning refers here to any camera setting which combines rectangular
#  neighborhoods of pixels into larger "super-pixels." It reduces the
#  resolution of the output image to
#  (width / binning_x) x (height / binning_y).
# The default values binning_x = binning_y = 0 is considered the same
#  as binning_x = binning_y = 1 (no subsampling).
uint32 binning_x
uint32 binning_y

# Region of interest (subwindow of full camera resolution), given in
#  full resolution (unbinned) image coordinates. A particular ROI
#  always denotes the same window of pixels on the camera sensor,
#  regardless of binning settings.
# The default setting of roi (all values 0) is considered the same as
#  full resolution (roi.width = width, roi.height = height).
RegionOfInterest roi

================================================================================
MSG: sensor_msgs/RegionOfInterest
# This message is used to specify a region of interest within an image.
#
# When used to specify the ROI setting of the camera when the image was
# taken, the height and width fields should either match the height and
# width fields for the associated image; or height = width = 0
# indicates that the full resolution image was captured.

uint32 x_offset  # Leftmost pixel of the ROI
                 # (0 if the ROI includes the left edge of the image)
uint32 y_offset  # Topmost pixel of the ROI
                 # (0 if the ROI includes the top edge of the image)
uint32 height    # Height of ROI
uint32 width     # Width of ROI

# True if a distinct rectified ROI should be calculated from the "raw"
# ROI in this message. Typically this should be False if the full image
# is captured (ROI not used), and True if a subwindow is captured (ROI
# used).
bool do_rectify
"""
  __slots__ = ['header','time_reference','image','info','shutter','gain','white_balance_blue','white_balance_red','temperature']
  _slot_types = ['std_msgs/Header','string','sensor_msgs/Image','sensor_msgs/CameraInfo','float32','float32','uint16','uint16','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,time_reference,image,info,shutter,gain,white_balance_blue,white_balance_red,temperature

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(WFOVImage, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.time_reference is None:
        self.time_reference = ''
      if self.image is None:
        self.image = sensor_msgs.msg.Image()
      if self.info is None:
        self.info = sensor_msgs.msg.CameraInfo()
      if self.shutter is None:
        self.shutter = 0.
      if self.gain is None:
        self.gain = 0.
      if self.white_balance_blue is None:
        self.white_balance_blue = 0
      if self.white_balance_red is None:
        self.white_balance_red = 0
      if self.temperature is None:
        self.temperature = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.time_reference = ''
      self.image = sensor_msgs.msg.Image()
      self.info = sensor_msgs.msg.CameraInfo()
      self.shutter = 0.
      self.gain = 0.
      self.white_balance_blue = 0
      self.white_balance_red = 0
      self.temperature = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.time_reference
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs))
      _x = self.image.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.image.height, _x.image.width))
      _x = self.image.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.image.is_bigendian, _x.image.step))
      _x = self.image.data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.info.header.seq, _x.info.header.stamp.secs, _x.info.header.stamp.nsecs))
      _x = self.info.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.info.height, _x.info.width))
      _x = self.info.distortion_model
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.info.D)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.info.D))
      buff.write(_get_struct_9d().pack(*self.info.K))
      buff.write(_get_struct_9d().pack(*self.info.R))
      buff.write(_get_struct_12d().pack(*self.info.P))
      _x = self
      buff.write(_get_struct_6IB2f2Hf().pack(_x.info.binning_x, _x.info.binning_y, _x.info.roi.x_offset, _x.info.roi.y_offset, _x.info.roi.height, _x.info.roi.width, _x.info.roi.do_rectify, _x.shutter, _x.gain, _x.white_balance_blue, _x.white_balance_red, _x.temperature))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.image is None:
        self.image = sensor_msgs.msg.Image()
      if self.info is None:
        self.info = sensor_msgs.msg.CameraInfo()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.time_reference = str[start:end].decode('utf-8')
      else:
        self.time_reference = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.image.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.image.height, _x.image.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.encoding = str[start:end].decode('utf-8')
      else:
        self.image.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.image.is_bigendian, _x.image.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.image.data = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.info.header.seq, _x.info.header.stamp.secs, _x.info.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.info.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.info.height, _x.info.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.distortion_model = str[start:end].decode('utf-8')
      else:
        self.info.distortion_model = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.info.D = struct.unpack(pattern, str[start:end])
      start = end
      end += 72
      self.info.K = _get_struct_9d().unpack(str[start:end])
      start = end
      end += 72
      self.info.R = _get_struct_9d().unpack(str[start:end])
      start = end
      end += 96
      self.info.P = _get_struct_12d().unpack(str[start:end])
      _x = self
      start = end
      end += 41
      (_x.info.binning_x, _x.info.binning_y, _x.info.roi.x_offset, _x.info.roi.y_offset, _x.info.roi.height, _x.info.roi.width, _x.info.roi.do_rectify, _x.shutter, _x.gain, _x.white_balance_blue, _x.white_balance_red, _x.temperature,) = _get_struct_6IB2f2Hf().unpack(str[start:end])
      self.info.roi.do_rectify = bool(self.info.roi.do_rectify)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.time_reference
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs))
      _x = self.image.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.image.height, _x.image.width))
      _x = self.image.encoding
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_BI().pack(_x.image.is_bigendian, _x.image.step))
      _x = self.image.data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.info.header.seq, _x.info.header.stamp.secs, _x.info.header.stamp.nsecs))
      _x = self.info.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2I().pack(_x.info.height, _x.info.width))
      _x = self.info.distortion_model
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.info.D)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.info.D.tostring())
      buff.write(self.info.K.tostring())
      buff.write(self.info.R.tostring())
      buff.write(self.info.P.tostring())
      _x = self
      buff.write(_get_struct_6IB2f2Hf().pack(_x.info.binning_x, _x.info.binning_y, _x.info.roi.x_offset, _x.info.roi.y_offset, _x.info.roi.height, _x.info.roi.width, _x.info.roi.do_rectify, _x.shutter, _x.gain, _x.white_balance_blue, _x.white_balance_red, _x.temperature))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.image is None:
        self.image = sensor_msgs.msg.Image()
      if self.info is None:
        self.info = sensor_msgs.msg.CameraInfo()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.time_reference = str[start:end].decode('utf-8')
      else:
        self.time_reference = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.image.header.seq, _x.image.header.stamp.secs, _x.image.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.image.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.image.height, _x.image.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.image.encoding = str[start:end].decode('utf-8')
      else:
        self.image.encoding = str[start:end]
      _x = self
      start = end
      end += 5
      (_x.image.is_bigendian, _x.image.step,) = _get_struct_BI().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.image.data = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.info.header.seq, _x.info.header.stamp.secs, _x.info.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.info.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 8
      (_x.info.height, _x.info.width,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.info.distortion_model = str[start:end].decode('utf-8')
      else:
        self.info.distortion_model = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.info.D = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 72
      self.info.K = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=9)
      start = end
      end += 72
      self.info.R = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=9)
      start = end
      end += 96
      self.info.P = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=12)
      _x = self
      start = end
      end += 41
      (_x.info.binning_x, _x.info.binning_y, _x.info.roi.x_offset, _x.info.roi.y_offset, _x.info.roi.height, _x.info.roi.width, _x.info.roi.do_rectify, _x.shutter, _x.gain, _x.white_balance_blue, _x.white_balance_red, _x.temperature,) = _get_struct_6IB2f2Hf().unpack(str[start:end])
      self.info.roi.do_rectify = bool(self.info.roi.do_rectify)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_12d = None
def _get_struct_12d():
    global _struct_12d
    if _struct_12d is None:
        _struct_12d = struct.Struct("<12d")
    return _struct_12d
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_6IB2f2Hf = None
def _get_struct_6IB2f2Hf():
    global _struct_6IB2f2Hf
    if _struct_6IB2f2Hf is None:
        _struct_6IB2f2Hf = struct.Struct("<6IB2f2Hf")
    return _struct_6IB2f2Hf
_struct_9d = None
def _get_struct_9d():
    global _struct_9d
    if _struct_9d is None:
        _struct_9d = struct.Struct("<9d")
    return _struct_9d
_struct_BI = None
def _get_struct_BI():
    global _struct_BI
    if _struct_BI is None:
        _struct_BI = struct.Struct("<BI")
    return _struct_BI
