;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname licastb-envinterp) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.ss" "teachpack" "htdp")))))
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

;; fun-def isa binding WAE
(define-struct fun-def (formal body))

;; fun-app isa binding fun
(define-struct fun-app (id actual))

;; fun-bind isa binding FWAE
(define-struct fun-bind (formal body env))

;; capture isa past binding
(define-struct capture (name named-expr env))


;; create an empty environment
(define (make-empty-env) empty)

;; extend an environment
(define (extend-env capt env)
  (cons capt env))

;; find a binding name from within an environment
(define (lookup id env)
  (cond
    [(empty? env) (error 'lookup "No identifier found for ~a" id)]
    [(equal? id (capture-name (first env))) (first env)]
    [else
     (lookup id (rest env))]
    ))


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
    [(equal? (first sexp) 'fun)
     (make-fun-def (parse (first (second sexp)))
                   (parse (third sexp)))]
    [else
     (make-fun-app (parse (first sexp))
                   (parse (second sexp)))]
    ))

;; interp : ast env -> number
;; Consumes an ast representation of an expression and computes
;; the corresponding numerical result using values stored in the env
(define (interp-in-exp ast env)
  (cond
    [(num? ast) (num-value ast)]
    [(id? ast)
     (interp-in-exp (capture-named-expr (lookup ast env)) env)]
    [(and (binop? ast) (equal? (binop-op ast) '+))
     (+ (interp-in-exp (binop-lhs ast) env) (interp-in-exp (binop-rhs ast) env))]
    [(and (binop? ast) (equal? (binop-op ast) '-))
     (- (interp-in-exp (binop-lhs ast) env) (interp-in-exp (binop-rhs ast) env))]
    [(and (binop? ast) (equal? (binop-op ast) '*))
     (* (interp-in-exp (binop-lhs ast) env) (interp-in-exp (binop-rhs ast) env))]
    [(and (binop? ast) (equal? (binop-op ast) '/))
     (/ (interp-in-exp (binop-lhs ast) env) (interp-in-exp (binop-rhs ast) env))]
    [(with? ast) 
     (interp-in-exp (with-body ast)
                    (extend-env (make-capture
                                 (binding-name (with-binding ast)) (binding-named-expr (with-binding ast)) env) env)
                    )]
    [(fun-app? ast)
     (let ([capt (lookup (fun-app-id ast) env)])
       (let ([function-formal (capture-named-expr capt)])
         (let ([old-env (capture-env capt)])
         (interp-in-exp (fun-def-body (capture-named-expr capt)) (extend-env (make-capture function-formal (interp-in-exp (fun-app-actual ast) env) env) old-env))
         )))]
  
  [(if0? ast)
   (cond
     [(zero? (interp-in-exp (if0-test-exp ast) env)) (interp-in-exp (if0-true-exp ast) env)]
     [else (interp-in-exp (if0-false-exp ast) env)]
     )]
  ))

(check-expect (interp-in-exp (parse '(with (x 5) (* x (with (y 3) y)))) (make-empty-env)) 15)
(check-expect (interp-in-exp (parse '(with (x 5) (* x (with (x 3) x)))) (make-empty-env)) 15)
(check-expect (interp-in-exp (parse '(with (x 5) (* x x))) (make-empty-env)) 25)
(check-expect (interp-in-exp (parse '(with (x 13) (+ x x))) (make-empty-env)) 26)
(check-expect (interp-in-exp (parse '(with (x 5) (- x x))) (make-empty-env)) 0)
(check-expect (interp-in-exp (parse '(with (x 42) (/ x (with (y 7) y)))) (make-empty-env)) 6)
(check-expect (interp-in-exp (parse '(if0 (with (x 5) (- x x)) (+ 5 3) (+ 42 80))) (make-empty-env)) 8)
(check-expect (interp-in-exp (parse '(if0 (with (x 5) (+ 22 x)) (+ 5 3) (+ 42 80))) (make-empty-env)) 122)
(check-expect (interp-in-exp (parse '(with (g (fun (x y) (+ x y))) (g 3 5))) (make-empty-env)) 8)