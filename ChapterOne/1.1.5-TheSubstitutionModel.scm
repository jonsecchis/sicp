#!/usr/bin/env gsi-script

;The interpreter can make substitutions using two methods:
;'Normal-order' when it fully expand and then reduce,
;'Applicative-order' when it evaluate the arguments and then apply.

;Example of procedure expansion using the Normal-order substitution model:
;(f 5)
;(sum-of-squares (+ 5 1) (* 5 2))
;(+ (square (+ 5 1)) (square (* 5 2)))
;(+ (* (+ 5 1)(+ 5 1)) (* (* 5 2)(* 5 2)))
;(+ (* 6 6) (* 10 10))
;(+ 36 100)
;136

;Example of procedure expansion using the Applicative-order substitution model:
;(f 5)
;(sum-of-squares (+ 5 1) (* 5 2))
;(+ (square 6) (square 10))
;(+ (* 6 6) (* 10 10))
;(+ 36 100)
;136
