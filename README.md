# cl-minimal-asdf-example

Minimal example of Common Lisp project relying on [ASDF](https://asdf.common-lisp.dev/).

## Register project in ASDF

In Common Lisp REPL:
```
(push #P"c:/.../cl-my-project/" asdf:*central-registry*)
```

For a permanent registration, add the above line in `.sbclrc` file

Verification: the below instructions in Common Lisp REPL shall yield no error.
```
(asdf:find-system :cl-my-project)
(asdf:find-system :cl-my-project-tests)
```

## Load system

To load system from Common Lisp REPL, use one of the following instructions:
```
,load-system [cl-my-project]
(asdf:load-system :cl-my-project)
(ql:quickload :cl-my-project)
```

At the beginning of the work session, it could be smarter to load tests system, which also force loading of main system:
```
,load-system [cl-my-project-tests]
(asdf:load-system :cl-my-project-tests)
(ql:quickload :cl-my-project-tests)
``` 

## Execute function

In Common Lisp REPL:
```
(cl-my-project:start)
```

Function `double` is not exported so two `:` are necessary:
```
(cl-my-project::double 2)
```

## Tests

To test system from Common Lisp REPL, use one of the following instructions:
```
,test-system [cl-my-project]
(asdf:test-system :cl-my-project)
(parachute:test 'cl-my-project-tests)
```

For a specfic test:
```
(parachute:test 'cl-my-project-tests::test-triple)
```

(end of README)
