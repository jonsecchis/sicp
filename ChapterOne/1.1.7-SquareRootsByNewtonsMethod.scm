#!/usr/bin/env gsi-script

(define (square-root n p)

  (define o+ (if (> n 1) / *))
  (define o- (if (> n 1) * /))

  (define (guess n c)
    (if (and (>= n 1) (< n 100) (even? c))
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

  (define (newton n g)
      (/ (+ g (/ n g)) 2))

  (define (precision n g p)
    (if (<= p 1)
      (exact->inexact (newton n g))
      (precision n (newton n g) (- p 1))))

  (precision n (guess n 0) p))

(pretty-print
  (square-root
    ;Argument 1
    (string->number (cadr (command-line)))
    ;Argument 2
    (string->number (caddr (command-line)))))
