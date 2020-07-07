
(cl:in-package :asdf)

(defsystem "getcalue-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Selective_Search_srv" :depends-on ("_package_Selective_Search_srv"))
    (:file "_package_Selective_Search_srv" :depends-on ("_package"))
  ))