

(asdf:defsystem "cl-my-project2"
  :name "cl-my-project2"
  :version "0.1.1"
  :author "John Doe"
  :licence "MIT"
  :description "A description"
  :long-description "A long description"
  :depends-on (:parachute ; for tests
               :cffi)
  :serial t ; load files in order
  :around-compile (lambda (next)
                    (proclaim '(optimize (debug 3) 
                                (safety 3)
                                (speed 0)))
                    (funcall next))
  :components ((:file "package")
               (:module "src"
                :components
                ((:file "file1")
                 (:file "file2"))))
  :in-order-to ((asdf:test-op (asdf:test-op :cl-my-project2-tests))))

