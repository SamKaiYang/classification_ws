// Generated by gencpp from file get_rs_image/FLIR_imageRequest.msg
// DO NOT EDIT!


#ifndef GET_RS_IMAGE_MESSAGE_FLIR_IMAGEREQUEST_H
#define GET_RS_IMAGE_MESSAGE_FLIR_IMAGEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace get_rs_image
{
template <class ContainerAllocator>
struct FLIR_imageRequest_
{
  typedef FLIR_imageRequest_<ContainerAllocator> Type;

  FLIR_imageRequest_()
    {
    }
  FLIR_imageRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> const> ConstPtr;

}; // struct FLIR_imageRequest_

typedef ::get_rs_image::FLIR_imageRequest_<std::allocator<void> > FLIR_imageRequest;

typedef boost::shared_ptr< ::get_rs_image::FLIR_imageRequest > FLIR_imageRequestPtr;
typedef boost::shared_ptr< ::get_rs_image::FLIR_imageRequest const> FLIR_imageRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace get_rs_image

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::get_rs_image::FLIR_imageRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "get_rs_image/FLIR_imageRequest";
  }

  static const char* value(const ::get_rs_image::FLIR_imageRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::get_rs_image::FLIR_imageRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FLIR_imageRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::get_rs_image::FLIR_imageRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::get_rs_image::FLIR_imageRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // GET_RS_IMAGE_MESSAGE_FLIR_IMAGEREQUEST_H
