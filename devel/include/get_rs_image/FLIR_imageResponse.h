// Generated by gencpp from file get_rs_image/FLIR_imageResponse.msg
// DO NOT EDIT!


#ifndef GET_RS_IMAGE_MESSAGE_FLIR_IMAGERESPONSE_H
#define GET_RS_IMAGE_MESSAGE_FLIR_IMAGERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/Image.h>

namespace get_rs_image
{
template <class ContainerAllocator>
struct FLIR_imageResponse_
{
  typedef FLIR_imageResponse_<ContainerAllocator> Type;

  FLIR_imageResponse_()
    : data()  {
    }
  FLIR_imageResponse_(const ContainerAllocator& _alloc)
    : data(_alloc)  {
  (void)_alloc;
    }



   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> const> ConstPtr;

}; // struct FLIR_imageResponse_

typedef ::get_rs_image::FLIR_imageResponse_<std::allocator<void> > FLIR_imageResponse;

typedef boost::shared_ptr< ::get_rs_image::FLIR_imageResponse > FLIR_imageResponsePtr;
typedef boost::shared_ptr< ::get_rs_image::FLIR_imageResponse const> FLIR_imageResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::get_rs_image::FLIR_imageResponse_<ContainerAllocator1> & lhs, const ::get_rs_image::FLIR_imageResponse_<ContainerAllocator2> & rhs)
{
  return lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::get_rs_image::FLIR_imageResponse_<ContainerAllocator1> & lhs, const ::get_rs_image::FLIR_imageResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace get_rs_image

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a4166222fac24d9abf5822c7d9b15b3b";
  }

  static const char* value(const ::get_rs_image::FLIR_imageResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa4166222fac24d9aULL;
  static const uint64_t static_value2 = 0xbf5822c7d9b15b3bULL;
};

template<class ContainerAllocator>
struct DataType< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "get_rs_image/FLIR_imageResponse";
  }

  static const char* value(const ::get_rs_image::FLIR_imageResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sensor_msgs/Image data\n"
"\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/Image\n"
"# This message contains an uncompressed image\n"
"# (0, 0) is at top-left corner of image\n"
"#\n"
"\n"
"Header header        # Header timestamp should be acquisition time of image\n"
"                     # Header frame_id should be optical frame of camera\n"
"                     # origin of frame should be optical center of camera\n"
"                     # +x should point to the right in the image\n"
"                     # +y should point down in the image\n"
"                     # +z should point into to plane of the image\n"
"                     # If the frame_id here and the frame_id of the CameraInfo\n"
"                     # message associated with the image conflict\n"
"                     # the behavior is undefined\n"
"\n"
"uint32 height         # image height, that is, number of rows\n"
"uint32 width          # image width, that is, number of columns\n"
"\n"
"# The legal values for encoding are in file src/image_encodings.cpp\n"
"# If you want to standardize a new string format, join\n"
"# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n"
"\n"
"string encoding       # Encoding of pixels -- channel meaning, ordering, size\n"
"                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n"
"\n"
"uint8 is_bigendian    # is this data bigendian?\n"
"uint32 step           # Full row length in bytes\n"
"uint8[] data          # actual matrix data, size is (step * rows)\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::get_rs_image::FLIR_imageResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FLIR_imageResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::get_rs_image::FLIR_imageResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::get_rs_image::FLIR_imageResponse_<ContainerAllocator>& v)
  {
    s << indent << "data: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GET_RS_IMAGE_MESSAGE_FLIR_IMAGERESPONSE_H
