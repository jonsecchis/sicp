#!/usr/bin/env gsi-script

;The general form of a conditional expression in Lisp Scheme is:
;(cond
;(<p1> <e1>)
;(<p2> <e2>)
;(<pn> <en>))

;Where the parenthesized pairs of expressions are called clauses.
;The interpreter evaluates each predicate until one of them returns true,
;in which case the interpreter returns the value of the 'consequent expression' <e>

;Example of case analysis to compute the absolute value of a number using 'cond'
(define (abs x)
(cond
((> x 0) x)
((= x 0) 0)
((< x 0) (- x))))

;Alternative way to write the absolute-value procedure
(define (abs x)
(cond ((< x 0) (- x))
(else x)))

;'else' is a special symbol that can be used in place of the <p> in the
;final clause of a cond

;Another alternative way to write the absolute-value procedure
(define (abs x)
(if (< x 0) 
(- x) x))

;This uses the special form 'if'.
;A restricted type of conditional that can be used when there are precisely
;two cases in the case analysis.

;The general form of an 'if' expressions is
;(if <predicate> <consequent> <alternative>)

;In addition to primitive predicates such as <, = and >
;there are logical composition operations:

;'AND' evaluates expressions left-to-right.
;Returns false and stops at any <e> that is false.
;Returns the value of the last expressions if all <e>'s evaluate to true.
;(and <e1>...<en>)

;'OR' evaluates expressions left-to-right.
;Returns the value of the first <e> that is true and stops.
;Returns false if all <e>'s evaluate to false. 
;(or <e1>...<en>)

;'NOT' expression evaluates to true when <e> is false, and false otherwise.
;(not <e>)

;Example of x in range 5 < x < 10
;(and (> x 5) (< x 10))

(pretty-print
(abs (string->number (cadr (command-line)))))
