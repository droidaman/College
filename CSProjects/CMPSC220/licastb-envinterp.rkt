;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname dalet-envinterp) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.ss" "teachpack" "htdp")))))
;;Code by Braden Licastro and Trent Dale

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

;; capture - captures the past envirnoment
(define-struct capture (name named-expr env))

;; fun-def when defining a function
(define-struct fun-def (formal body))

;; fun-app when applying a function
(define-struct fun-app (id actual))

;; fun-bind is a FWAE
(define-struct fun-bind (formal body env))

;; if0 isa WAE WAE WAE
(define-struct if0 (test-exp true-exp false-exp))



;; Make an empty environment
(define (make-empty-env) empty)

;; Extend an environment
(define (extend-env capt env) (cons capt env))

;; look-up an identifier in the given environment
(define (lookup id env) 
  (cond
    [(empty? env) (error 'lookup "No identifier found for ~a" id)]
    [(equal? id (capture-name (first env))) (first env)]
    [else
     (lookup id (rest env))]
    )
  )

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


;; interp-env : ast env -> number
;; Consumes a FWAE and an environment (current) and computes
;; the corresponding numerical result
(define (interp-env ast env)
  (cond
    [(num? ast) (num-value ast)]
    [(id? ast) 
     (interp-env (capture-named-expr (lookup ast env)) env)]
    [(and (binop? ast) (equal? (binop-op ast) '+)) 
     (+ (interp-env (binop-lhs ast) env) (interp-env (binop-rhs ast) env))]
    [(and (binop? ast) (equal? (binop-op ast) '-)) 
     (- (interp-env (binop-lhs ast) env) (interp-env (binop-rhs ast) env))]
    [(and (binop? ast) (equal? (binop-op ast) '*)) 
     (* (interp-env (binop-lhs ast) env) (interp-env (binop-rhs ast) env))]
    [(and (binop? ast) (equal? (binop-op ast) '/)) 
     (/ (interp-env (binop-lhs ast) env) (interp-env (binop-rhs ast) env))]
    [(with? ast) 
     (interp-env (with-body ast) (extend-env (make-capture (binding-name (with-binding ast))
                                                           (binding-named-expr (with-binding ast))
                                                           env)
                                             env))]
    [(if0? ast)
     (cond
       [(zero? (interp-env (if0-test-exp ast) env)) (interp-env (if0-true-exp ast) env)]
       [else (interp-env (if0-false-exp ast) env)]
       )]
    [(fun-app? ast)
     (let ([cap (lookup (fun-app-id ast) env)])
       (let ([funct-def (capture-named-expr cap)])
         (let ([funct-formal (fun-def-formal funct-def)])
           (let ([old-env (capture-env cap)])
             (interp-env (fun-def-body funct-def) 
                         (extend-env 
                          (make-capture funct-formal 
                                        (make-num (interp-env (fun-app-actual ast) env)) 
                                        env) 
                          old-env))))))
     ]
    [else (printf "~a ~n" ast)]
    ))

(check-expect (interp-env (parse '(with (x 5) (* x (with (y 3) y)))) (make-empty-env)) 15)
(check-expect (interp-env (parse '(with (x 5) (* x (with (x 3) x)))) (make-empty-env)) 15)
(check-expect (interp-env (parse '(with (x 5) (* x x))) (make-empty-env)) 25)
(check-expect (interp-env (parse '(with (x 13) (+ x x))) (make-empty-env)) 26)
(check-expect (interp-env (parse '(with (x 5) (- x x))) (make-empty-env)) 0)
(check-expect (interp-env (parse '(with (x 42) (/ x (with (y 7) y)))) (make-empty-env)) 6)
(check-expect (interp-env (parse '(if0 (with (x 5) (- x x)) (+ 5 3) (+ 42 80))) (make-empty-env)) 8)
(check-expect (interp-env (parse '(if0 (with (x 5) (+ 22 x)) (+ 5 3) (+ 42 80))) (make-empty-env)) 122)
(check-expect (interp-env (parse '(with (f (fun (x) (+ x 1))) (f 3))) (make-empty-env)) 4)