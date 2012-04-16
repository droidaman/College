;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname class20111020) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.ss" "teachpack" "htdp")))))
(let ([id, val]
      [id2, val2]
      [...]
      )
  body)

(define (interp ast)
  (
   [(with? ast)
    (let ([the-id (binding-id(with-binding ast))]
          [the-val (binding-named-expr (with-binding ast))]
          [the-body ... ])
      (interp(subst ...)))]
   ))

;;                | is a formal parameter 
(with (add1 (fin (x)
                 (+ x 1)))
;;               | actual parameter
      (+ 3 (add1 4)))

;;Functions are binding forms.

(with (cack (fin (n)
                 (if0 n
;;                    |
                      (* n (cack (- n 1)))))))

Sfter running subst...
(if0 5
;;   |
     (* 5 (cack (- 5 1)))
     
;;          |
;; Cack is now a free identifier and cannot be dealt with.
;; the program will crash.
     