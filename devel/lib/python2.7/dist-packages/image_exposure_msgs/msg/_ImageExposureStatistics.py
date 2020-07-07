# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from image_exposure_msgs/ImageExposureStatistics.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy
import statistics_msgs.msg

class ImageExposureStatistics(genpy.Message):
  _md5sum = "334dc170ce6287d1de470f25be78dd9e"
  _type = "image_exposure_msgs/ImageExposureStatistics"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# message for exposure statistics reported a single image
time stamp         # image time stamp
string time_reference # The name of the reference clock for this message's timestamp.
float32 shutterms  # shutter durations in ms
float32 gaindb     # gain in decibels
# pixel exposure and latency statistics
uint32 underExposed # number of pixels underexposed
uint32 overExposed  # number of pixels overexposed
statistics_msgs/Stats1D pixelVal   # distribution of pixel values in the image
statistics_msgs/Stats1D pixelAge   # distribution of pixel ages in frames
# irradiance = pixelval/(shutterTime*10^(gaindb/10.0))
float64 meanIrradiance
float64 minMeasurableIrradiance
float64 maxMeasurableIrradiance
float64 minObservedIrradiance
float64 maxObservedIrradiance



================================================================================
MSG: statistics_msgs/Stats1D
# statistics of a 1-D distribution
float64 min
float64 max 
float64 mean 
float64 variance
int64 N
"""
  __slots__ = ['stamp','time_reference','shutterms','gaindb','underExposed','overExposed','pixelVal','pixelAge','meanIrradiance','minMeasurableIrradiance','maxMeasurableIrradiance','minObservedIrradiance','maxObservedIrradiance']
  _slot_types = ['time','string','float32','float32','uint32','uint32','statistics_msgs/Stats1D','statistics_msgs/Stats1D','float64','float64','float64','float64','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       stamp,time_reference,shutterms,gaindb,underExposed,overExposed,pixelVal,pixelAge,meanIrradiance,minMeasurableIrradiance,maxMeasurableIrradiance,minObservedIrradiance,maxObservedIrradiance

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ImageExposureStatistics, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.stamp is None:
        self.stamp = genpy.Time()
      if self.time_reference is None:
        self.time_reference = ''
      if self.shutterms is None:
        self.shutterms = 0.
      if self.gaindb is None:
        self.gaindb = 0.
      if self.underExposed is None:
        self.underExposed = 0
      if self.overExposed is None:
        self.overExposed = 0
      if self.pixelVal is None:
        self.pixelVal = statistics_msgs.msg.Stats1D()
      if self.pixelAge is None:
        self.pixelAge = statistics_msgs.msg.Stats1D()
      if self.meanIrradiance is None:
        self.meanIrradiance = 0.
      if self.minMeasurableIrradiance is None:
        self.minMeasurableIrradiance = 0.
      if self.maxMeasurableIrradiance is None:
        self.maxMeasurableIrradiance = 0.
      if self.minObservedIrradiance is None:
        self.minObservedIrradiance = 0.
      if self.maxObservedIrradiance is None:
        self.maxObservedIrradiance = 0.
    else:
      self.stamp = genpy.Time()
      self.time_reference = ''
      self.shutterms = 0.
      self.gaindb = 0.
      self.underExposed = 0
      self.overExposed = 0
      self.pixelVal = statistics_msgs.msg.Stats1D()
      self.pixelAge = statistics_msgs.msg.Stats1D()
      self.meanIrradiance = 0.
      self.minMeasurableIrradiance = 0.
      self.maxMeasurableIrradiance = 0.
      self.minObservedIrradiance = 0.
      self.maxObservedIrradiance = 0.

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
      buff.write(_get_struct_2I().pack(_x.stamp.secs, _x.stamp.nsecs))
      _x = self.time_reference
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2f2I4dq4dq5d().pack(_x.shutterms, _x.gaindb, _x.underExposed, _x.overExposed, _x.pixelVal.min, _x.pixelVal.max, _x.pixelVal.mean, _x.pixelVal.variance, _x.pixelVal.N, _x.pixelAge.min, _x.pixelAge.max, _x.pixelAge.mean, _x.pixelAge.variance, _x.pixelAge.N, _x.meanIrradiance, _x.minMeasurableIrradiance, _x.maxMeasurableIrradiance, _x.minObservedIrradiance, _x.maxObservedIrradiance))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.stamp is None:
        self.stamp = genpy.Time()
      if self.pixelVal is None:
        self.pixelVal = statistics_msgs.msg.Stats1D()
      if self.pixelAge is None:
        self.pixelAge = statistics_msgs.msg.Stats1D()
      end = 0
      _x = self
      start = end
      end += 8
      (_x.stamp.secs, _x.stamp.nsecs,) = _get_struct_2I().unpack(str[start:end])
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
      end += 136
      (_x.shutterms, _x.gaindb, _x.underExposed, _x.overExposed, _x.pixelVal.min, _x.pixelVal.max, _x.pixelVal.mean, _x.pixelVal.variance, _x.pixelVal.N, _x.pixelAge.min, _x.pixelAge.max, _x.pixelAge.mean, _x.pixelAge.variance, _x.pixelAge.N, _x.meanIrradiance, _x.minMeasurableIrradiance, _x.maxMeasurableIrradiance, _x.minObservedIrradiance, _x.maxObservedIrradiance,) = _get_struct_2f2I4dq4dq5d().unpack(str[start:end])
      self.stamp.canon()
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
      buff.write(_get_struct_2I().pack(_x.stamp.secs, _x.stamp.nsecs))
      _x = self.time_reference
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2f2I4dq4dq5d().pack(_x.shutterms, _x.gaindb, _x.underExposed, _x.overExposed, _x.pixelVal.min, _x.pixelVal.max, _x.pixelVal.mean, _x.pixelVal.variance, _x.pixelVal.N, _x.pixelAge.min, _x.pixelAge.max, _x.pixelAge.mean, _x.pixelAge.variance, _x.pixelAge.N, _x.meanIrradiance, _x.minMeasurableIrradiance, _x.maxMeasurableIrradiance, _x.minObservedIrradiance, _x.maxObservedIrradiance))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.stamp is None:
        self.stamp = genpy.Time()
      if self.pixelVal is None:
        self.pixelVal = statistics_msgs.msg.Stats1D()
      if self.pixelAge is None:
        self.pixelAge = statistics_msgs.msg.Stats1D()
      end = 0
      _x = self
      start = end
      end += 8
      (_x.stamp.secs, _x.stamp.nsecs,) = _get_struct_2I().unpack(str[start:end])
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
      end += 136
      (_x.shutterms, _x.gaindb, _x.underExposed, _x.overExposed, _x.pixelVal.min, _x.pixelVal.max, _x.pixelVal.mean, _x.pixelVal.variance, _x.pixelVal.N, _x.pixelAge.min, _x.pixelAge.max, _x.pixelAge.mean, _x.pixelAge.variance, _x.pixelAge.N, _x.meanIrradiance, _x.minMeasurableIrradiance, _x.maxMeasurableIrradiance, _x.minObservedIrradiance, _x.maxObservedIrradiance,) = _get_struct_2f2I4dq4dq5d().unpack(str[start:end])
      self.stamp.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
_struct_2f2I4dq4dq5d = None
def _get_struct_2f2I4dq4dq5d():
    global _struct_2f2I4dq4dq5d
    if _struct_2f2I4dq4dq5d is None:
        _struct_2f2I4dq4dq5d = struct.Struct("<2f2I4dq4dq5d")
    return _struct_2f2I4dq4dq5d
