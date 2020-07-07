# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "disposing_vision: 1 messages, 0 services")

set(MSG_I_FLAGS "-Idisposing_vision:/home/iclab/Documents/classification_ws/src/disposing_vision/msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(disposing_vision_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg" NAME_WE)
add_custom_target(_disposing_vision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "disposing_vision" "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(disposing_vision
  "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/disposing_vision
)

### Generating Services

### Generating Module File
_generate_module_cpp(disposing_vision
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/disposing_vision
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(disposing_vision_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(disposing_vision_generate_messages disposing_vision_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg" NAME_WE)
add_dependencies(disposing_vision_generate_messages_cpp _disposing_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(disposing_vision_gencpp)
add_dependencies(disposing_vision_gencpp disposing_vision_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS disposing_vision_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(disposing_vision
  "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/disposing_vision
)

### Generating Services

### Generating Module File
_generate_module_eus(disposing_vision
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/disposing_vision
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(disposing_vision_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(disposing_vision_generate_messages disposing_vision_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg" NAME_WE)
add_dependencies(disposing_vision_generate_messages_eus _disposing_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(disposing_vision_geneus)
add_dependencies(disposing_vision_geneus disposing_vision_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS disposing_vision_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(disposing_vision
  "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/disposing_vision
)

### Generating Services

### Generating Module File
_generate_module_lisp(disposing_vision
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/disposing_vision
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(disposing_vision_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(disposing_vision_generate_messages disposing_vision_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg" NAME_WE)
add_dependencies(disposing_vision_generate_messages_lisp _disposing_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(disposing_vision_genlisp)
add_dependencies(disposing_vision_genlisp disposing_vision_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS disposing_vision_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(disposing_vision
  "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/disposing_vision
)

### Generating Services

### Generating Module File
_generate_module_nodejs(disposing_vision
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/disposing_vision
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(disposing_vision_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(disposing_vision_generate_messages disposing_vision_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg" NAME_WE)
add_dependencies(disposing_vision_generate_messages_nodejs _disposing_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(disposing_vision_gennodejs)
add_dependencies(disposing_vision_gennodejs disposing_vision_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS disposing_vision_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(disposing_vision
  "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/disposing_vision
)

### Generating Services

### Generating Module File
_generate_module_py(disposing_vision
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/disposing_vision
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(disposing_vision_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(disposing_vision_generate_messages disposing_vision_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iclab/Documents/classification_ws/src/disposing_vision/msg/coordinate_normal.msg" NAME_WE)
add_dependencies(disposing_vision_generate_messages_py _disposing_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(disposing_vision_genpy)
add_dependencies(disposing_vision_genpy disposing_vision_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS disposing_vision_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/disposing_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/disposing_vision
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(disposing_vision_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/disposing_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/disposing_vision
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(disposing_vision_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/disposing_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/disposing_vision
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(disposing_vision_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/disposing_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/disposing_vision
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(disposing_vision_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/disposing_vision)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/disposing_vision\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/disposing_vision
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(disposing_vision_generate_messages_py sensor_msgs_generate_messages_py)
endif()
