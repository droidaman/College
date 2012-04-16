#lang racket
(require test-engine/racket-tests)

; 1.
;; CONTRACT
;; cond-parse : expression -> type
;; PURPOSE
;; This function will take in an expression and returns the type.
(define (cond-parse exp)
  (cond
    [(number? exp) "number"]
    [(symbol? exp) "symbol"]
    [(string? exp) "string"]
    [(boolean? exp) "boolean"]
    [(cons? exp)
     (cond
       [(equal? 'define (first exp))
        (cond
          [(cons? (first (rest exp)))
           (format "definition of function ~a with body ~a" (first (second exp)) (third exp))]
          [else
           "value definition"]
          )
        ]
       [(equal? 'define-struct (first exp))
        (format "~a structure" (first (rest exp)))]
       [else
        "list"]
       )]
    ))


;; TESTS

(check-expect (cond-parse 42) "number")

(check-expect (cond-parse 'artistformerlyknownas) "symbol")

(check-expect (cond-parse "Uh oh.") "string")

(check-expect (cond-parse false) "boolean")

(check-expect (cond-parse true) "boolean")

(check-expect (cond-parse '(1 2 3)) "list")

(check-expect (cond-parse '(a b c)) "list")

(check-expect (cond-parse '(define meaning 42)) "value definition")

(check-expect (cond-parse '(define x (+ 1 3))) "value definition")

(check-expect (cond-parse '(define-struct point (x y))) "point structure")

(check-expect (cond-parse '(define-struct onion (color ogre))) "onion structure")

(check-expect (cond-parse '(define (even? n) ...)) "definition of function even? with body ...")

(check-expect (cond-parse '(define (super n) ...))  "definition of function super with body ...")

(test)