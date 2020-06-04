(defpackage cl-swbymabeweb.web
  (:use :cl
        :caveman2
        :cl-swbymabeweb.config)
  (:export :*web*)
  (:import-from #:controller.index
                #:index))
(in-package :cl-swbymabeweb.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (log:debug "Index route called.")
  (controller.index:index))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app)))
