// Generated by gencpp from file ROS_Socket/arm_dataRequest.msg
// DO NOT EDIT!


#ifndef ROS_SOCKET_MESSAGE_ARM_DATAREQUEST_H
#define ROS_SOCKET_MESSAGE_ARM_DATAREQUEST_H


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
struct arm_dataRequest_
{
  typedef arm_dataRequest_<ContainerAllocator> Type;

  arm_dataRequest_()
    : x(0.0)
    , y(0.0)
    , z(0.0)
    , pitch(0.0)
    , roll(0.0)
    , yaw(0.0)  {
    }
  arm_dataRequest_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , z(0.0)
    , pitch(0.0)
    , roll(0.0)
    , yaw(0.0)  {
  (void)_alloc;
    }



   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _z_type;
  _z_type z;

   typedef double _pitch_type;
  _pitch_type pitch;

   typedef double _roll_type;
  _roll_type roll;

   typedef double _yaw_type;
  _yaw_type yaw;





  typedef boost::shared_ptr< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> const> ConstPtr;

}; // struct arm_dataRequest_

typedef ::ROS_Socket::arm_dataRequest_<std::allocator<void> > arm_dataRequest;

typedef boost::shared_ptr< ::ROS_Socket::arm_dataRequest > arm_dataRequestPtr;
typedef boost::shared_ptr< ::ROS_Socket::arm_dataRequest const> arm_dataRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ROS_Socket::arm_dataRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ROS_Socket::arm_dataRequest_<ContainerAllocator1> & lhs, const ::ROS_Socket::arm_dataRequest_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z &&
    lhs.pitch == rhs.pitch &&
    lhs.roll == rhs.roll &&
    lhs.yaw == rhs.yaw;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ROS_Socket::arm_dataRequest_<ContainerAllocator1> & lhs, const ::ROS_Socket::arm_dataRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ROS_Socket

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3b457b086d97c0b31179d3e04e742fce";
  }

  static const char* value(const ::ROS_Socket::arm_dataRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3b457b086d97c0b3ULL;
  static const uint64_t static_value2 = 0x1179d3e04e742fceULL;
};

template<class ContainerAllocator>
struct DataType< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ROS_Socket/arm_dataRequest";
  }

  static const char* value(const ::ROS_Socket::arm_dataRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 pitch\n"
"float64 roll\n"
"float64 yaw\n"
;
  }

  static const char* value(const ::ROS_Socket::arm_dataRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.pitch);
      stream.next(m.roll);
      stream.next(m.yaw);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct arm_dataRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ROS_Socket::arm_dataRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ROS_Socket::arm_dataRequest_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<double>::stream(s, indent + "  ", v.z);
    s << indent << "pitch: ";
    Printer<double>::stream(s, indent + "  ", v.pitch);
    s << indent << "roll: ";
    Printer<double>::stream(s, indent + "  ", v.roll);
    s << indent << "yaw: ";
    Printer<double>::stream(s, indent + "  ", v.yaw);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_SOCKET_MESSAGE_ARM_DATAREQUEST_H
