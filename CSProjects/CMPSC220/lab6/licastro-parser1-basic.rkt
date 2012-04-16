;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname licastro-parser1-basic) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; CONTRACT
;; AE? : expression -> boolean
(define (AE? exp)
  (cond
    [(number? exp) true]
    [(and 
      (cons? exp)
      (equal? (first exp) '+))
     (and
      (AE? (second exp))
      (AE? (third exp)))]
    [(and 
      (cons? exp)
      (equal? (first exp) '-))
     (and
      (AE? (second exp))
      (AE? (third exp)))]
    [else
     false]
    ))

(define-struct num (value))
(define-struct plus (lhs rhs))
(define-struct minus (lhs rhs))
(define-struct mult (lhs rhs))
(define-struct div (lhs rhs))

(define (cond-parse-ae exp)
  (cond
    [(number? exp) (make-num exp)]
    [(equal? (first exp) '+)
     (make-plus (cond-parse-ae (second exp)) (cond-parse-ae (third exp)))]
    [(equal? (first exp) '-)
     (make-minus (cond-parse-ae (second exp)) (cond-parse-ae (third exp)))]
    [(equal? (first exp) '*)
     (make-mult (cond-parse-ae (second exp)) (cond-parse-ae (third exp)))]
    [(equal? (first exp) '/)
     (make-div (cond-parse-ae (second exp)) (cond-parse-ae (third exp)))]
    ))


(check-expect (AE? 42) true)
(check-expect (AE? '{+ 3 5}) true)
(check-expect (AE? '{- 3 5}) true)
(check-expect (AE? '{+ 3 x}) false)
(check-expect (AE? 'artistformerlyknownas) false)

(check-expect (cond-parse-ae 42) (make-num 42))

(check-expect (cond-parse-ae '{+ 3 5})
              (make-plus (make-num 3) (make-num 5)))

(check-expect (cond-parse-ae '{* 3 5})
              (make-mult (make-num 3) (make-num 5)))

(check-expect (cond-parse-ae '{/ 3 5})
              (make-div (make-num 3) (make-num 5)))

(check-expect (cond-parse-ae '{- 0 0})
              (make-minus (make-num 0) (make-num 0)))

(check-expect (cond-parse-ae '{+ {+ 0 0} {+ 0 0}})
              (make-plus (make-plus (make-num 0) (make-num 0))
                         (make-plus (make-num 0) (make-num 0))))