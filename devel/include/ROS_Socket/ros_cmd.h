// Generated by gencpp from file ROS_Socket/ros_cmd.msg
// DO NOT EDIT!


#ifndef ROS_SOCKET_MESSAGE_ROS_CMD_H
#define ROS_SOCKET_MESSAGE_ROS_CMD_H


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
struct ros_cmd_
{
  typedef ros_cmd_<ContainerAllocator> Type;

  ros_cmd_()
    : Arm_State_feedback(0)  {
    }
  ros_cmd_(const ContainerAllocator& _alloc)
    : Arm_State_feedback(0)  {
  (void)_alloc;
    }



   typedef int32_t _Arm_State_feedback_type;
  _Arm_State_feedback_type Arm_State_feedback;





  typedef boost::shared_ptr< ::ROS_Socket::ros_cmd_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ROS_Socket::ros_cmd_<ContainerAllocator> const> ConstPtr;

}; // struct ros_cmd_

typedef ::ROS_Socket::ros_cmd_<std::allocator<void> > ros_cmd;

typedef boost::shared_ptr< ::ROS_Socket::ros_cmd > ros_cmdPtr;
typedef boost::shared_ptr< ::ROS_Socket::ros_cmd const> ros_cmdConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ROS_Socket::ros_cmd_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ROS_Socket::ros_cmd_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ROS_Socket::ros_cmd_<ContainerAllocator1> & lhs, const ::ROS_Socket::ros_cmd_<ContainerAllocator2> & rhs)
{
  return lhs.Arm_State_feedback == rhs.Arm_State_feedback;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ROS_Socket::ros_cmd_<ContainerAllocator1> & lhs, const ::ROS_Socket::ros_cmd_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ROS_Socket

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::ROS_Socket::ros_cmd_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ROS_Socket::ros_cmd_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ROS_Socket::ros_cmd_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ROS_Socket::ros_cmd_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ROS_Socket::ros_cmd_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ROS_Socket::ros_cmd_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ROS_Socket::ros_cmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2b5d469cbc8bdcbdfd4b75c0d0da98bb";
  }

  static const char* value(const ::ROS_Socket::ros_cmd_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2b5d469cbc8bdcbdULL;
  static const uint64_t static_value2 = 0xfd4b75c0d0da98bbULL;
};

template<class ContainerAllocator>
struct DataType< ::ROS_Socket::ros_cmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ROS_Socket/ros_cmd";
  }

  static const char* value(const ::ROS_Socket::ros_cmd_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ROS_Socket::ros_cmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 Arm_State_feedback\n"
;
  }

  static const char* value(const ::ROS_Socket::ros_cmd_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ROS_Socket::ros_cmd_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.Arm_State_feedback);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ros_cmd_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ROS_Socket::ros_cmd_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ROS_Socket::ros_cmd_<ContainerAllocator>& v)
  {
    s << indent << "Arm_State_feedback: ";
    Printer<int32_t>::stream(s, indent + "  ", v.Arm_State_feedback);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_SOCKET_MESSAGE_ROS_CMD_H