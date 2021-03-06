;; Pass 2

#lang racket
(require "base.rkt")
(provide create-ids)


;; PURPOSE
;; Take in the structures from the previous pass
;; and produce a list of structures (broken down into the simple forms)
;; CONTRACT
;; createids : struct -> list of (lists of) ids

#|
(+ 3 5) -> (simple + (num 3) (num 5)) -> (prog
                                            (id a 3)
                                            (id b 5)
                                            (id c (+ a b)))

(+ 3 (+ 2 3)) -> (binop + 3 (simple + (num 2) (num 3))
                          |
                          -> (prog
                                (id a 2)        (*)
                                (id b 3)        (**)
                                (id c (+ a b))  (***)
                                (id d 3)
                                (id e (+ c d)))
|#

  

#|
(cond
                        [(empty? structure) 0]
                        [else (cons (createids (first (seq-expressions structure)))
                                    (createids (rest (seq-expressions structure))))]
|#

;; This function is used to extract syms from lists as well as id structs
(define (last ls)
  (first (reverse ls)))

(define (extract-sym i)
  (cond
    [(list? i) (id-sym (last i))]
    [else (id-sym i)]
    ))

;; This is the main parsing pass, and parses all received structs into id structs
;; returns a list of lists that must be flattened by create-ids
(define (createids structure)
  (cond
    [(seq? structure) (map createids (seq-expressions structure))]
                         
                         
    [(binop? structure) (let ([lhs (createids (binop-lhs structure))]
                              [rhs (createids (binop-rhs structure))])
                          (append
                           lhs
                           rhs
                           (list
                            (id (sym 'bin) (binop (binop-op structure)
                                                     (extract-sym (last lhs))
                                                     (extract-sym (last rhs))
                                                     )))))]
    [(jump? structure) (let ([t (createids (jump-test structure))])
                         (append
                          t
                          (list
                           (id (sym 'jmp) (jump (jump-jumpsym structure)
                                                (variable (extract-sym (last t)))
                                                (jump-jumpdest structure))
                               ))))]
                        
                                                          
    [(set? structure) (let ([e (createids (set-e structure))])
                          (append
                           e
                           (list
                            (id (set-ident structure) (extract-sym (last e))))))]
    [(goto? structure) (list (id (sym 'goto) (goto (goto-sym structure))))]
    [(label? structure) (list (id (sym 'label) (label (label-sym structure))))]
    [(num? structure) (list (id (sym 'num) (num-value structure)))]
    [(variable? structure) (list (id (sym 'sym) (variable-value structure)))]
    ))

;; This function will return the final formatted output of the pass
(define (create-ids structure)
  (flatten (createids structure)))