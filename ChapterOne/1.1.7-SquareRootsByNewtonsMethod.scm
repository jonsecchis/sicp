#!/usr/bin/env gsi-script

(define (root n)

;Calculate the square root of 'n' with a guess 'g' using the Newton-Raphson method
(define (calc n g)
(if (< (abs (- n (* g g))) 0.001) (exact->inexact g)
(calc n (/ (+ g (/ n g)) 2))))

;Compute the final guess value for the method by iterating 'c' times over 'd' 
;until 'd' is back in the range of the square root of 'n' where 'c' is
;the counter from previous procedures divided by '2'.
(define (bck d c)
(if (<= c 1) (calc n d)
(bck ((if (> n 1) * /)  d 10) (- c 1))))

;Returns a 'd' that is the nearest square root of 'x'
;where 'd' is a guess digit starting from '9' and iterating 'd - 1'
(define (nrt x d c)
(if (>= x (* d d)) (bck d (/ c 2))
(nrt x (- d 1) c)))

;Get a new number 'x' that is 'n' divided 'c' times by 10
;until 'x' is in range '1 < x < 100' for 'n > 1'
;passing '9' as the starting digit 'd' to find the nearest root of 'x'.
(define (rdc x c)
(if (< x 100) (nrt x 9 c)
(rdc (/ x 10) (+ c 1))))

;Get a new number 'x' that is 'n' multiplied 'c' times by 10
;until 'x' is in range '10 < x < 100' for 'n < 1'
;passing '9' as the starting digit 'd' to find the nearest root of 'x'.
(define (amp x c)
(if (and (> x 10) (< x 100)) (nrt x 9 c)
(amp (* x 10) (+ c 1))))

;Call a 'reduce' or 'amplify' procedure depending whether 'n > 1' or 'n < 1'
;passing '0' as the initializer for the counter 'c'.
(if (> n 1)
(rdc n 0)
(amp n 0)))

(pretty-print
(root (string->number (cadr (command-line)))))
