
(cl:in-package :asdf)

(defsystem "disposing_vision-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "coordinate_normal" :depends-on ("_package_coordinate_normal"))
    (:file "_package_coordinate_normal" :depends-on ("_package"))
  ))