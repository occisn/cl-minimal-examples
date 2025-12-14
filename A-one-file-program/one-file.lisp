;;; C-c C-k to compile file 

(eval-when (:compile-toplevel)
  (ql:quickload :cffi))

(defpackage my-page
  (:use :cl :cffi)
  (:export
   nb-of-processors))

(in-package :my-page)

(declaim (optimize (debug 3) 
                   (safety 3)
                   (speed 0)))

(cffi:defctype dword :unsigned-long)

(cffi:defctype word :unsigned-short)

(cffi:defcstruct processor-struct
  (processor-architecture word)
  (reserved word))

(cffi:defcunion oem-union
  (oem-ide dword)
  (processor-struct (:struct processor-struct)))

(cffi:defcstruct system-info
  (oem-info (:union oem-union))
  (page-size dword)
  (minimum-application-address :pointer)
  (maximum-application-address :pointer)
  (active-processor-mask (:pointer dword))
  (number-of-processors dword)
  (processor-type dword)
  (allocation-granularity dword)
  (processor-level word)
  (processor-revision word))

(cffi:defcfun ("GetSystemInfo" get-system-info) :void
  (data (:pointer (:struct system-info))))

(defun nb-of-processors ()
  "Get CPU Threads count."
  (cffi:with-foreign-object (info '(:struct system-info))
    (get-system-info info)
    (cffi:foreign-slot-value info '(:struct system-info)
                             'number-of-processors)))

(defun double (x) (* x 2))

(defun main ()
  (format t "Hello world!~%")
  (format t "Double of 3 is ~a.~%" (double 3))
  (format t "Number of processors is ~a.~%" (nb-of-processors)))

;; end
