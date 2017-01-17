#!/usr/bin/env gsi-script

(define (fact n)
(if (= n 1) 1
(* n (fact (- n 1)))))

(pretty-print "10! equals to")
(pretty-print (fact 10))
