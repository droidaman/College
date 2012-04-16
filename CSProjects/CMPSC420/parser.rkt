#lang racket
(struct binop (op lhs rhs) #:transparent)
(struct num (value)        #:transparent)
                 
(define prog1 8)
(define prog2 '(+ 3 5))
(define prog3 '(+ 3 (- 7 2)))

;; operator? :: symbol->boolean
(define (operator? o)
  (member o '(+ -)))

;; Parse s-expressions to data structures
;; parse :: list -> structures
(define (parse sexp)
  (match sexp
    [(? number?)(num sexp)]
    [(list (? operator? op) lhs rhs)(binop op (parse lhs) (parse rhs))]
    [else
     (error "SOMETHING IS OBVIOUSLY WRONG")]
    ))

(define (check-l0 ast)
  (match ast
    [(struct num (value)) (num value)]
    [(struct binop ((? operator? op) lhs rhs))
     (binop op 
            (check-l0 lhs) (check-l0 rhs))]
    ))