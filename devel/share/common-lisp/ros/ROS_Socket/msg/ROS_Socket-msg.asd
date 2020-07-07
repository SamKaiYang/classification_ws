
(cl:in-package :asdf)

(defsystem "ROS_Socket-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ROI" :depends-on ("_package_ROI"))
    (:file "_package_ROI" :depends-on ("_package"))
    (:file "ROI_array" :depends-on ("_package_ROI_array"))
    (:file "_package_ROI_array" :depends-on ("_package"))
    (:file "ros_cmd" :depends-on ("_package_ros_cmd"))
    (:file "_package_ros_cmd" :depends-on ("_package"))
  ))