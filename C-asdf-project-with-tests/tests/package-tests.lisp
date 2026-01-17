(defpackage cl-project-tests
  (:use cl cl-project)
  (:import-from cl-project
                double
                triple
                ))
;; instead of 'import-from', you can also refer to functions
;; in tests files as cl-my-project::double, etc.

;; (in-package :cl-my-project2-tests)



