#lang racket
(match '(foo (bar 3 5) x y)
  [`(foo, subls, sym)
   (printf "Sublist: ~a~nSymbol: ~a~n" subls sym)]
  [`(foo, subls, sym, sym2)
   (printf "Sublist: ~a~nSymbol: ~a, ~a~n" subls sym sym2)]
  )
    
;; CONTRACT
;; interp : AE -> number
(define (interp exp)
  (match exp
    [`(+ ,ae ,ae2)
     (+ (interp ae) (interp ae2))]
    [`(- ,ae ,ae2)
     (- (interp ae) (interp ae2))]
    [`(* ,ae ,ae2)
     (* (interp ae) (interp ae2))]
    [`(/ ,ae ,ae2)
     (/ (interp ae) (interp ae2))]
    [`(if0 ,ae ,ae2 ,ae3)
     ( (interp ae) (interp ae2) (interp ae3))]
    [(? number?)
     exp]
    )
  )