(asdf:defsystem "cl-my-project2-tests"
  :depends-on ("cl-my-project2" "parachute")
  :serial t
  :components ((:module "tests"
                :around-compile (lambda (next)
                                  (proclaim '(optimize (debug 3) 
                                              (safety 3)
                                              (speed 0)))
                                  (funcall next))
                :components ((:file "package-tests")
                             (:file "file2-tests"))))
  :perform (asdf:test-op (op c) (uiop:symbol-call :parachute :test  :cl-my-project2-tests)))
