
(cl:in-package :asdf)

(defsystem "ROS_Socket-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "arm_data" :depends-on ("_package_arm_data"))
    (:file "_package_arm_data" :depends-on ("_package"))
    (:file "arm_mode" :depends-on ("_package_arm_mode"))
    (:file "_package_arm_mode" :depends-on ("_package"))
    (:file "arm_state" :depends-on ("_package_arm_state"))
    (:file "_package_arm_state" :depends-on ("_package"))
    (:file "grip_mode" :depends-on ("_package_grip_mode"))
    (:file "_package_grip_mode" :depends-on ("_package"))
    (:file "sent_flag" :depends-on ("_package_sent_flag"))
    (:file "_package_sent_flag" :depends-on ("_package"))
    (:file "speed_mode" :depends-on ("_package_speed_mode"))
    (:file "_package_speed_mode" :depends-on ("_package"))
  ))