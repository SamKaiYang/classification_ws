# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ROS_Socket: 3 messages, 6 services")

set(MSG_I_FLAGS "-IROS_Socket:/home/iclab/Documents/classification_ws/src/ROS_Socket/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ROS_Socket_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv" NAME_WE)
add_custom_target(_ROS_Socket_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ROS_Socket" "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv" ""
)

get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg" NAME_WE)
add_custom_target(_ROS_Socket_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ROS_Socket" "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg" "ROS_Socket/ROI"
)

get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg" NAME_WE)
add_custom_target(_ROS_Socket_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ROS_Socket" "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg" ""
)

get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv" NAME_WE)
add_custom_target(_ROS_Socket_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ROS_Socket" "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv" ""
)

get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv" NAME_WE)
add_custom_target(_ROS_Socket_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ROS_Socket" "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv" ""
)

get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg" NAME_WE)
add_custom_target(_ROS_Socket_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ROS_Socket" "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg" ""
)

get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv" NAME_WE)
add_custom_target(_ROS_Socket_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ROS_Socket" "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv" ""
)

get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv" NAME_WE)
add_custom_target(_ROS_Socket_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ROS_Socket" "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv" ""
)

get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv" NAME_WE)
add_custom_target(_ROS_Socket_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ROS_Socket" "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
)
_generate_msg_cpp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
)
_generate_msg_cpp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg"
  "${MSG_I_FLAGS}"
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
)

### Generating Services
_generate_srv_cpp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
)
_generate_srv_cpp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
)
_generate_srv_cpp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
)
_generate_srv_cpp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
)
_generate_srv_cpp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
)
_generate_srv_cpp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
)

### Generating Module File
_generate_module_cpp(ROS_Socket
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ROS_Socket_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ROS_Socket_generate_messages ROS_Socket_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_cpp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_cpp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_cpp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_cpp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_cpp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_cpp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_cpp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_cpp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_cpp _ROS_Socket_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ROS_Socket_gencpp)
add_dependencies(ROS_Socket_gencpp ROS_Socket_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ROS_Socket_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
)
_generate_msg_eus(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
)
_generate_msg_eus(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg"
  "${MSG_I_FLAGS}"
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
)

### Generating Services
_generate_srv_eus(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
)
_generate_srv_eus(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
)
_generate_srv_eus(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
)
_generate_srv_eus(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
)
_generate_srv_eus(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
)
_generate_srv_eus(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
)

### Generating Module File
_generate_module_eus(ROS_Socket
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ROS_Socket_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ROS_Socket_generate_messages ROS_Socket_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_eus _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_eus _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_eus _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_eus _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_eus _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_eus _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_eus _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_eus _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_eus _ROS_Socket_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ROS_Socket_geneus)
add_dependencies(ROS_Socket_geneus ROS_Socket_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ROS_Socket_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
)
_generate_msg_lisp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
)
_generate_msg_lisp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg"
  "${MSG_I_FLAGS}"
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
)

### Generating Services
_generate_srv_lisp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
)
_generate_srv_lisp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
)
_generate_srv_lisp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
)
_generate_srv_lisp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
)
_generate_srv_lisp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
)
_generate_srv_lisp(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
)

### Generating Module File
_generate_module_lisp(ROS_Socket
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ROS_Socket_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ROS_Socket_generate_messages ROS_Socket_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_lisp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_lisp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_lisp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_lisp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_lisp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_lisp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_lisp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_lisp _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_lisp _ROS_Socket_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ROS_Socket_genlisp)
add_dependencies(ROS_Socket_genlisp ROS_Socket_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ROS_Socket_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
)
_generate_msg_nodejs(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
)
_generate_msg_nodejs(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg"
  "${MSG_I_FLAGS}"
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
)

### Generating Services
_generate_srv_nodejs(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
)
_generate_srv_nodejs(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
)
_generate_srv_nodejs(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
)
_generate_srv_nodejs(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
)
_generate_srv_nodejs(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
)
_generate_srv_nodejs(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
)

### Generating Module File
_generate_module_nodejs(ROS_Socket
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ROS_Socket_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ROS_Socket_generate_messages ROS_Socket_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_nodejs _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_nodejs _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_nodejs _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_nodejs _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_nodejs _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_nodejs _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_nodejs _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_nodejs _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_nodejs _ROS_Socket_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ROS_Socket_gennodejs)
add_dependencies(ROS_Socket_gennodejs ROS_Socket_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ROS_Socket_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
)
_generate_msg_py(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
)
_generate_msg_py(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg"
  "${MSG_I_FLAGS}"
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
)

### Generating Services
_generate_srv_py(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
)
_generate_srv_py(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
)
_generate_srv_py(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
)
_generate_srv_py(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
)
_generate_srv_py(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
)
_generate_srv_py(ROS_Socket
  "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
)

### Generating Module File
_generate_module_py(ROS_Socket
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ROS_Socket_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ROS_Socket_generate_messages ROS_Socket_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_py _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI_array.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_py _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ros_cmd.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_py _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/grip_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_py _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/speed_mode.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_py _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/msg/ROI.msg" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_py _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/sent_flag.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_py _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_state.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_py _ROS_Socket_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/ROS_Socket/srv/arm_data.srv" NAME_WE)
add_dependencies(ROS_Socket_generate_messages_py _ROS_Socket_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ROS_Socket_genpy)
add_dependencies(ROS_Socket_genpy ROS_Socket_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ROS_Socket_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ROS_Socket
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ROS_Socket_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ROS_Socket
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ROS_Socket_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ROS_Socket
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ROS_Socket_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ROS_Socket
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ROS_Socket_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ROS_Socket
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ROS_Socket_generate_messages_py std_msgs_generate_messages_py)
endif()
