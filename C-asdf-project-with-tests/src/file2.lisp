(in-package cl-project)

(defun double (x)
  "Return twice the value of X."
  (declare (type fixnum x))
  (* 2 x))

(defun triple (x)
  "Return three times the value of X."
  (declare (type fixnum x))
  (* 3 x))

(defun main ()
  "Entry point displaying demo output."
  (format t "Hello world!~%"))

;;; end
