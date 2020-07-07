# Install script for directory: /home/iclab/Documents/classification_ws/src/ROS_Socket

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/iclab/Documents/classification_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ROS_Socket/msg" TYPE FILE FILES
    "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg"
    "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
    "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ROS_Socket/srv" TYPE FILE FILES
    "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv"
    "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv"
    "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv"
    "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv"
    "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv"
    "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ROS_Socket/cmake" TYPE FILE FILES "/home/iclab/Documents/classification_ws/build/ROS_Socket/catkin_generated/installspace/ROS_Socket-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/iclab/Documents/classification_ws/devel/include/ROS_Socket")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/iclab/Documents/classification_ws/devel/share/roseus/ros/ROS_Socket")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/iclab/Documents/classification_ws/devel/share/common-lisp/ros/ROS_Socket")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/iclab/Documents/classification_ws/devel/share/gennodejs/ros/ROS_Socket")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/iclab/Documents/classification_ws/devel/lib/python2.7/dist-packages/ROS_Socket")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/iclab/Documents/classification_ws/devel/lib/python2.7/dist-packages/ROS_Socket")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ROS_Socket" TYPE FILE FILES "/home/iclab/Documents/classification_ws/devel/include/ROS_Socket/TutorialsConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/ROS_Socket" TYPE FILE FILES "/home/iclab/Documents/classification_ws/devel/lib/python2.7/dist-packages/ROS_Socket/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/iclab/Documents/classification_ws/devel/lib/python2.7/dist-packages/ROS_Socket/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/ROS_Socket" TYPE DIRECTORY FILES "/home/iclab/Documents/classification_ws/devel/lib/python2.7/dist-packages/ROS_Socket/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/iclab/Documents/classification_ws/build/ROS_Socket/catkin_generated/installspace/ROS_Socket.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ROS_Socket/cmake" TYPE FILE FILES "/home/iclab/Documents/classification_ws/build/ROS_Socket/catkin_generated/installspace/ROS_Socket-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ROS_Socket/cmake" TYPE FILE FILES
    "/home/iclab/Documents/classification_ws/build/ROS_Socket/catkin_generated/installspace/ROS_SocketConfig.cmake"
    "/home/iclab/Documents/classification_ws/build/ROS_Socket/catkin_generated/installspace/ROS_SocketConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ROS_Socket" TYPE FILE FILES "/home/iclab/Documents/classification_ws/src/ROS_Socket/package.xml")
endif()

