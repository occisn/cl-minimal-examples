# cl-minimal-examples



## About the example relying on relying on [ASDF](https://asdf.common-lisp.dev/) with tests.

### Register project in ASDF

In Common Lisp REPL:
```
(push #P"c:/.../cl-my-project2/" asdf:*central-registry*)
```

For a permanent registration, add the above line in `.sbclrc` file

Verification: the below instructions in Common Lisp REPL shall yield no error.
```
(asdf:find-system :cl-my-project2)
(asdf:find-system :cl-my-project2-tests)
```

### Load system

To load system from Common Lisp REPL, use one of the following instructions:
```
,load-system [cl-my-project2]
(asdf:load-system :cl-my-project2)
(ql:quickload :cl-my-project2)
```

At the beginning of the work session, it could be smarter to load tests system, which also force loading of main system:
```
,load-system [cl-my-project2-tests]
(asdf:load-system :cl-my-project2-tests)
(ql:quickload :cl-my-project2-tests)
``` 

### Execute function

In Common Lisp REPL:
```
(cl-my-project2:start)
```

Function `double` is not exported so two `:` are necessary:
```
(cl-my-project2::double 2)
```

### Tests

To test system from Common Lisp REPL, use one of the following instructions:
```
,test-system [cl-my-project2]
(asdf:test-system :cl-my-project2)
(parachute:test 'cl-my-project2-tests)
```

For a specific test:
```
(parachute:test 'cl-my-project2-tests::test-triple)
```

(end of README)
