// Generated by gencpp from file ROS_Socket/sent_flag.msg
// DO NOT EDIT!


#ifndef ROS_SOCKET_MESSAGE_SENT_FLAG_H
#define ROS_SOCKET_MESSAGE_SENT_FLAG_H

#include <ros/service_traits.h>


#include <ROS_Socket/sent_flagRequest.h>
#include <ROS_Socket/sent_flagResponse.h>


namespace ROS_Socket
{

struct sent_flag
{

typedef sent_flagRequest Request;
typedef sent_flagResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct sent_flag
} // namespace ROS_Socket


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::ROS_Socket::sent_flag > {
  static const char* value()
  {
    return "6e5879da81627af41fb741e0047f9b21";
  }

  static const char* value(const ::ROS_Socket::sent_flag&) { return value(); }
};

template<>
struct DataType< ::ROS_Socket::sent_flag > {
  static const char* value()
  {
    return "ROS_Socket/sent_flag";
  }

  static const char* value(const ::ROS_Socket::sent_flag&) { return value(); }
};


// service_traits::MD5Sum< ::ROS_Socket::sent_flagRequest> should match
// service_traits::MD5Sum< ::ROS_Socket::sent_flag >
template<>
struct MD5Sum< ::ROS_Socket::sent_flagRequest>
{
  static const char* value()
  {
    return MD5Sum< ::ROS_Socket::sent_flag >::value();
  }
  static const char* value(const ::ROS_Socket::sent_flagRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::ROS_Socket::sent_flagRequest> should match
// service_traits::DataType< ::ROS_Socket::sent_flag >
template<>
struct DataType< ::ROS_Socket::sent_flagRequest>
{
  static const char* value()
  {
    return DataType< ::ROS_Socket::sent_flag >::value();
  }
  static const char* value(const ::ROS_Socket::sent_flagRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::ROS_Socket::sent_flagResponse> should match
// service_traits::MD5Sum< ::ROS_Socket::sent_flag >
template<>
struct MD5Sum< ::ROS_Socket::sent_flagResponse>
{
  static const char* value()
  {
    return MD5Sum< ::ROS_Socket::sent_flag >::value();
  }
  static const char* value(const ::ROS_Socket::sent_flagResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::ROS_Socket::sent_flagResponse> should match
// service_traits::DataType< ::ROS_Socket::sent_flag >
template<>
struct DataType< ::ROS_Socket::sent_flagResponse>
{
  static const char* value()
  {
    return DataType< ::ROS_Socket::sent_flag >::value();
  }
  static const char* value(const ::ROS_Socket::sent_flagResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROS_SOCKET_MESSAGE_SENT_FLAG_H
