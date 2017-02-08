#!/usr/bin/env gsi-script

(define (root n)

(define (calc n g)
(if (< (abs (- n (* g g))) 0.001) (exact->inexact g)
(calc n (/ (+ g (/ n g)) 2))))

(define (bck d c)
(if (<= c 1) (calc n d)
(bck ((if (> n 1) * /)  d 10) (- c 1))))

(define (nrt x d c)
(if (>= x (* d d)) (bck d (/ c 2))
(nrt x (- d 1) c)))

(define (rdc x c)
(if (< x 100) (nrt x 9 c)
(rdc (/ x 10) (+ c 1))))

(define (amp x c)
(if (and (> x 10) (< x 100)) (nrt x 9 c)
(amp (* x 10) (+ c 1))))

(if (> n 1)
(rdc n 0)
(amp n 0)))

(pretty-print
(root (string->number (cadr (command-line)))))
