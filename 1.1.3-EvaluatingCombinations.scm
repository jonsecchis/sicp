#!/usr/bin/env gsi-script

;The interpreter itself applies a recursive procedure to evaluate expressions.
;It applies the procedures starting from inner subexpressions and following outwards.
;This is an example of a 'tree accumulation' process.

;Example
(pretty-print
(*(+ 2 (* 4 6))(+ 3 5 7)))
