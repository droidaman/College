;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname dalet-substlab) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.ss" "teachpack" "htdp")))))
;; Braden Licastro and Trent Dale
;; CMPSC220

;; binding isa id WAE
(define-struct binding (name named-expr))

;; num isa number
(define-struct num (value))

;; binop isa symbol WAE WAE
(define-struct binop (op lhs rhs))

;; with isa binding WAE
(define-struct with (binding body))

;; id isa symbol
(define-struct id (name))

;; if0 isa WAE WAE WAE
(define-struct if0 (test-exp true-exp false-exp))

;; parse : s-exp -> WAE
;; Consumes an s-expression and generates the corresponding WAE
(define (parse sexp)
  (cond
    [(empty? sexp) empty]
    [(number? sexp) (make-num sexp)]
    [(symbol? sexp) (make-id sexp)]
    [(equal? (first sexp) '+)
     (make-binop (first sexp) (parse (second sexp)) (parse (third sexp)))]
    [(equal? (first sexp) '-)
     (make-binop (first sexp) (parse (second sexp)) (parse (third sexp)))]
    [(equal? (first sexp) '*)
     (make-binop (first sexp) (parse (second sexp)) (parse (third sexp)))]
    [(equal? (first sexp) '/)
     (make-binop (first sexp) (parse (second sexp)) (parse (third sexp)))]
    [(equal? (first sexp) 'with)
     (make-with (make-binding (parse (first (second sexp))) (parse (second (second sexp)))) 
                (parse (third sexp)))]
    [(equal? (first sexp) 'if0)
     (make-if0 (parse (second sexp)) (parse (third sexp)) (parse (fourth sexp)))]
    ))

(define (subst id val WAE)
  (cond
    [(num? WAE) WAE]
    [(id? WAE)
     (cond
       [(equal? id WAE) val]
       [else WAE])
     ]
    [(binop? WAE) (make-binop (binop-op WAE) 
                              (subst id val (binop-lhs WAE))
                              (subst id val (binop-rhs WAE)))]
    [(with? WAE) (subst (binding-name (with-binding WAE))
                        (binding-named-expr (with-binding WAE))
                        (with-body WAE))]
    [(if0? WAE) (make-if0 (subst id val (if0-test-exp WAE))
                          (subst id val (if0-true-exp WAE))
                          (subst id val (if0-false-exp WAE)))]
    ))

;; interp : WAE -> number
;; Consumes a WAE representation of an expression and computes
;; the corresponding numerical result
(define (interp expr)
  (cond
    [(num? expr) (num-value expr)]
    [(and (binop? expr) (equal? (binop-op expr) '+)) (+ (interp (binop-lhs expr)) (interp (binop-rhs expr)))]
    [(and (binop? expr) (equal? (binop-op expr) '-)) (- (interp (binop-lhs expr)) (interp (binop-rhs expr)))]
    [(and (binop? expr) (equal? (binop-op expr) '*)) (* (interp (binop-lhs expr)) (interp (binop-rhs expr)))]
    [(and (binop? expr) (equal? (binop-op expr) '/)) (/ (interp (binop-lhs expr)) (interp (binop-rhs expr)))]
    [(with? expr) 
     (interp (subst (binding-name (with-binding expr)) (binding-named-expr (with-binding expr)) (with-body expr)))]
    [(if0? expr)
     (cond
       [(zero? (interp (if0-test-exp expr))) (interp (if0-true-exp expr))]
       [else (interp (if0-false-exp expr))]
       )]
    ))

#;(define-syntax with
    (lambda (exp)
      (syntax-case exp ()
        [(with (id exp) body)
         #'(let ([id exp])
             body)])))

(check-expect (interp (parse '(with (x 5) (* x (with (y 3) y))))) 15)
(check-expect (interp (parse '(with (x 5) (* x x)))) 25)
(check-expect (interp (parse '(with (x 13) (+ x x)))) 26)
(check-expect (interp (parse '(with (x 5) (- x x)))) 0)
(check-expect (interp (parse '(with (x 42) (/ x (with (y 7) y))))) 6)
(check-expect (interp (parse '(if0 (with (x 5) (- x x)) (+ 5 3) (+ 42 80)))) 8)
(check-expect (interp (parse '(if0 (with (x 5) (+ 22 x)) (+ 5 3) (+ 42 80)))) 122)