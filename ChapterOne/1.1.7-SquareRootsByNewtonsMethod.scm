#!/usr/bin/env gsi-script

;Square Root Program with Precision Index
;Written by Jon Secchis.
;2017
;
;It takes two arguments:
;1 - A positive number 'n'
;2 - An index of precision 'p'
;

(define (square-root n p)

  ;First we define some helper operators
  ;depending if 'n' is greater or less than 1
  (define o+ (if (> n 1) / *))
  (define o- (if (> n 1) * /))

  ;Now we use the helper operator to multiply or divide
  ;'n' by 10 until the following is true:
  ;1 - 'n' is bigger or equal to 1,
  ;2 - 'n' is less than 100,
  ;3 - We have performed an even number of operations 'c'.
  ;'c' is initialized with 0.
  (define (guess n c)
    (if (and (>= n 1) (< n 100) (even? c))
      ;The condition was met and we have a number between 1 and 99.
      ;We must perform 2 operations with that number:
      ;1 - Look for the exact or lower square root of that number,
      ;    for example, if the number is 63 we must get 7
      ;    because 8² is greater than 63. But if the number is 64
      ;    we must get 8.
      ;    We do that by searching. We start from 9² and iterate
      ;    (9 - 1)² until a match is found.
      ;    This job is done by the procedure 'near-root' that here
      ;    we pass as arguments the number 'n' and '9' as a starting point.
      ;2 - After finding that 'near-root' we must now restore the number
      ;    by applying the inverse operation we did before.
      ;    But instead of performing that inverse operation the
      ;    same number of times we did to get here, we permorm only half (c/2)!
      ;    Example for 'n = 6300':
      ;    63 (divided by 10 two times using o+) (c = 2)
      ;    7² (the near-low-root of 63 returned from 'near-root' func.)
      ;    70 (multiplied by 10 one time using o- returned from 'restore' func.)
      ;    70 is our initial guess for Newton's method!
      (restore (near-root n 9) (/ c 2))
      (guess (o+ n 10) (+ c 1))))

  (define (near-root n d)
    (if (>= n (* d d))
      d
      (near-root n (- d 1))))

  (define (restore d c)
    (if (< c 1)
      d
      (restore (o- d 10) (- c 1))))

  ;The Newton's method!
  (define (newton n g)
      (/ (+ g (/ n g)) 2))

  ;The more times you perform the Newton's method over
  ;the initial guess, the closer you get to a perfect root!
  (define (calc n g p)
    (if (<= p 1)
      ;Precision is down to 1
      ;perform Newton's method one time over the initial guess 'g' and return.
      (exact->inexact (newton n g))
      ;Precision is greater than 1
      ;perform Newton's method over the initial guess 'g' until 'p' is down to 1.
      (calc n (newton n g) (- p 1))))

  ;Initialize!
  ;Calculate an initial guess 'g' for the square root of 'n'
  ;and apply Newton's method 'p' times to that guess!
  (calc n (guess n 0) p))

(pretty-print
  (square-root
    ;Argument 1 from the command line
    (string->number (cadr (command-line)))
    ;Argument 2 from the command line
    (string->number (caddr (command-line)))))
