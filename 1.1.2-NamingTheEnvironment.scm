#!/usr/bin/env gsi-script

;Define is a special-form inside Lisp language.
;It assigns a value to a name that can be used as a substitute later.
;This is the most primitive form of abstraction.

;Associating
(define size 2)

;Calling the value
(pretty-print size)

;Using the name within an expression
(pretty-print (* 5 size))
