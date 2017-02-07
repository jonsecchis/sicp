#!/usr/bin/env gsi-script

;Exercise 1.1
; What is the output printed by the interpreter to each expression?

;10
10

;12
(+ 5 3 4)

;8
(- 9 1)

;3
(/ 6 2)

;6
(+ (* 2 4) (- 4 6))

;19
(define a 3)
(define b (+ a 1))
(+ a b (* a b))

;false
(= a b)

;4
(if (and (> b a) (< b (* a b))) 
b
a)

;16
(cond ((= a 4) 6)
((= b 4) (+ 6 7 a))
(else 25))

;6
(+ 2 (if (> b a) b a))

;16
(* (cond ((> a b) a)
((< a b) b)
(else -1))
(+ a 1))

;Exercise 1.2
;Translate the expression into prefix form

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))(* 3 (- 6 2) (- 2 7)))

;Exercise 1.3
;Define a procedure that takes three numbers as arguments
;and returns the sum of the squares of the two larger numbers

(define (f a b c)
(define mean (/ (+ a b c) 3))
(define (add-squares x y) (+ (* x x) (* y y)))
(cond
((> mean a) (add-squares b c))
((> mean b) (add-squares a c))
((> mean c) (add-squares a b))
(else (add-squares a b))))

;Exercise 1.4
;Observe that our model of evaluation allows for combinations
;whose operators are compound expressions. Use this observation
;to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

;Answer
;The guard condition inside the procedure definition will test
;whether the argument 'b' is positive or negative and return
;the appropriate operator in order to satisfy the sum of 'a'
;with an absolute 'b'.

;Exercise 1.5
;The following test determines whether the interpreter uses
;applicative-order or normal-order evaluation.
;What behavior will we obeserve for each evaluation model?

(define (p) (p))
(define (test x y)
(if (= x 0) 0 y))

(test 0 (p))

;Answer
;A normal-order interpreter will evaluate the first argument
;of the procedure 'test' and immediately return 0.
;An applicative-order interpreter will first expand the
;arguments of the procedure 'test' and consequently not respond,
;since 'y' returns an infinite loop recursive procedure.


