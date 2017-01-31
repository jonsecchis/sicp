#!/usr/bin/env gsi-script

;Procedure definition is a much more powerful abstraction.
;We can give a name to a compound operation and then refer to it as a unit.

;General form of procedure definition in Lisp Scheme
;(define (<name> <formal parameters>) <body>)

;A procedure definition for squaring a number
(define (square x)
(* x x))

;Using it
(pretty-print
(square 21))

(pretty-print
(square (+ 2 5)))

(pretty-print
(square (square 3)))

;Using a procedure definition as a building block for other procedures
(define (sum-of-squares x y)
(+ (square x) (square y)))

(pretty-print
(sum-of-squares 3 4))

;Using sum-of-squares to build further procedures
(define (f a)
(sum-of-squares (+ a 1) (* a 2)))

(pretty-print
(f 5))
