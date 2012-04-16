;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname licastro-lab3) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.ss" "teachpack" "htdp")))))
; 3.
;; PURPOSE
;; Count how many items arte inside the list.
;; CONTRACT
;; ls list -> int

(define (lengthlist list)
  (cond
    [(empty? list) 0]
    [(cons? list)
     (add1 (lengthlist (rest list)))
    ]))

; 4.
;; PURPOSE
;; Return whether a list has a true value in it.
;; CONTRACT
;; ls: list -> boolean
(define (contains-true? ls)
  (cond
    [(empty? ls) false]
    [(cons? ls)
     (if (first ls) true (contains-true? (rest ls)))
     ]))

; 5. 
;; PURPOSE
;; Sums the numbers in a list.
;; CONTRACT
;; ls: list -> int
(define (sum-nums ls)
  (cond
    [(empty? ls) 0]
    [(cons? ls)
     (+ (first ls) (sum-nums (rest ls)))
     ]))

; 6.
;; PURPOSE
;; Takes a list and sees if there are any matching characters.
;; CONTRACT
;; ls: character, list -> boolean
(define (char-in? in ls)
  (cond
    [(empty? ls) false]
    [(cons? ls)
     (if (equal? in (first ls)) true (char-in? in (rest ls)))
     ]))

; 7.
;; PURPOSE
;; Take ion a character and use the char-in function to check and see if it is a vowel.
;; CONTRACT
;; in: character -> function call
(define (vowel? in)
  (char-in? in (list #\a #\A #\e #\E #\i #\I #\o #\O #\u #\U))
)

; 8.
;; PURPOSE
;; lorem imsum et dolar
;; CONTRACT
;; lorem ipsum et dolar
(define (svc-fun in)
  (cond
    [(empty? (string->list in)) 0]
    [(cons? (string->list in))
     (if (vowel? (first (string->list in))) (+ 1 (svc-fun (substring in 1 (string-length in)))) (svc-fun (substring in 1 (string-length in))))
     ]))