#lang racket
(require test-engine/racket-tests)

;; binding isa id WAE
(struct binding (name named-expr))

;; num isa number
(struct num (value))

;; binop isa symbol WAE WAE
(struct binop (op lhs rhs))

;; with isa binding WAE
(struct with (binding body))

;; id isa symbol
(struct id (name))


;; parse : s-exp -> WAE 
;; Consumes an s-expression and generates the corresponding WAE
#;(define (parse sexp)
    (cond
      [(empty? sexp) empty]
      [(with? sexp)
       ...]
      ))

#;(define (subst id val ast)
    (cond
      [(num? ast) ast]
      [(id? ast) (if (equal? id ast)
                     val
                     ast)]
      [(binding? ast) ]
      [(binop? ast) ]
      [(with? ast) ]
      ))

;; interp : WAE -> number 
;; Consumes a WAE representation of an expression and computes 
;; the corresponding numerical result 
(define (interp expr)
     (cond
       [(equal? (binop-op expr) +) (+ (binop-lhs expr) (binop-rhs expr))]
       [(equal? (binop-op expr) -) (- (binop-lhs expr) (binop-rhs expr))]
       [(equal? (binop-op expr) *) (* (binop-lhs expr) (binop-rhs expr))]
       [(equal? (binop-op expr) /) (/ (binop-lhs expr) (binop-rhs expr))]
    ))

;;This code tests to see if interp is working properly.
(check-expect (interp (binop + 6 5)) 11)
(check-expect (interp (binop - 9 1)) 8)
(check-expect (interp (binop * 12 12)) 144)
(check-expect (interp (binop / 4 2)) 2)

;; The first 3 tests come out to be my birthday
;(check-expect (with (x 4) (+ x x)) 8)
;(check-expect (with (a -4) (with (b 11) (with (c (/ 15 7)) (* c (+ a b))))) 15)
;(check-expect (/ 7964 (with (t 9) (with (r 5) (- t r)))) 1991)
;; ... and this one is just the answer to everything in the universe
;(check-expect (with (q 99) (with (p (- q 15)) (- p 42))) 42)


;(check-expect (interp (parse '(with (x 5) (+ x x)))) 10)

(test)