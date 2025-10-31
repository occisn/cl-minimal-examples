(defpackage cl-my-project-tests
  (:use cl cl-my-project)
  (:import-from cl-my-project
                double
                triple
                ))
;; instead of 'import-from', you can also refer to functions
;; in tests files as cl-my-project::double, etc.

(in-package :cl-my-project-tests)


