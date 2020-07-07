// Generated by gencpp from file ROS_Socket/arm_modeResponse.msg
// DO NOT EDIT!


#ifndef ROS_SOCKET_MESSAGE_ARM_MODERESPONSE_H
#define ROS_SOCKET_MESSAGE_ARM_MODERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ROS_Socket
{
template <class ContainerAllocator>
struct arm_modeResponse_
{
  typedef arm_modeResponse_<ContainerAllocator> Type;

  arm_modeResponse_()
    : mode(0)  {
    }
  arm_modeResponse_(const ContainerAllocator& _alloc)
    : mode(0)  {
  (void)_alloc;
    }



   typedef int32_t _mode_type;
  _mode_type mode;





  typedef boost::shared_ptr< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> const> ConstPtr;

}; // struct arm_modeResponse_

typedef ::ROS_Socket::arm_modeResponse_<std::allocator<void> > arm_modeResponse;

typedef boost::shared_ptr< ::ROS_Socket::arm_modeResponse > arm_modeResponsePtr;
typedef boost::shared_ptr< ::ROS_Socket::arm_modeResponse const> arm_modeResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ROS_Socket::arm_modeResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ROS_Socket::arm_modeResponse_<ContainerAllocator1> & lhs, const ::ROS_Socket::arm_modeResponse_<ContainerAllocator2> & rhs)
{
  return lhs.mode == rhs.mode;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ROS_Socket::arm_modeResponse_<ContainerAllocator1> & lhs, const ::ROS_Socket::arm_modeResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ROS_Socket

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ff63f6ea3c3e9b7504b2cb3ee0a09d92";
  }

  static const char* value(const ::ROS_Socket::arm_modeResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xff63f6ea3c3e9b75ULL;
  static const uint64_t static_value2 = 0x04b2cb3ee0a09d92ULL;
};

template<class ContainerAllocator>
struct DataType< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ROS_Socket/arm_modeResponse";
  }

  static const char* value(const ::ROS_Socket::arm_modeResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 mode\n"
"\n"
;
  }

  static const char* value(const ::ROS_Socket::arm_modeResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mode);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct arm_modeResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ROS_Socket::arm_modeResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ROS_Socket::arm_modeResponse_<ContainerAllocator>& v)
  {
    s << indent << "mode: ";
    Printer<int32_t>::stream(s, indent + "  ", v.mode);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_SOCKET_MESSAGE_ARM_MODERESPONSE_H