;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname work_with_scheme_c_1) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.ss" "teachpack" "htdp")))))
;; squeeze
;; "hello world" "oh poo"
;; ellwrld

;;CONTRACT
;; squeeze: : string string -> string
(define (squeeze s1 s2)
  (list->string
        (sq-help (string->list s1)
                 (string->list s2))))

;;CONRACT
(define (sq-help ls1 ls2)
        (cond
          [(empty? ls1) empty]
          [(empty? ls2) empty]
          [(member (first ls1) ls2)  (sq-help (rest ls1) ls2)]
          [else (append (first ls1) (sq-help (rest ls1) ls2))]
          ))

(check-expect (squeeze "hello world" "oh poo") "ellwrld")