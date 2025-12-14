(defpackage cl-my-project2-tests
  (:use cl cl-my-project2)
  (:import-from cl-my-project2
                double
                triple
                ))
;; instead of 'import-from', you can also refer to functions
;; in tests files as cl-my-project::double, etc.

(in-package :cl-my-project2-tests)


