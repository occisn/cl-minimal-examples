(in-package :cl-my-project-tests)

(parachute:define-test test-triple
  (parachute:is
   = 12 (triple 4)))

;; === end
