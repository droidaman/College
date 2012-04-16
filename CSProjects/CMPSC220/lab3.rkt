;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname lab3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
; 1
;;DNC

; 2
;; CONTRACT
;;(define build-message ()
;;  '((was (a))man)')
;;
;;(check-expect build-message '((was (a)) man))

; 3

; 4

; 5

; 6

; 7

; 8

; 9

; 10

; 11
(define (fact x)
  (cond
    [(> x 1) (* x (fact (- x 1)))]
    [(= x 1) (* x (fact x))]
    ))

;;(check-expect (fact 5) 120)

; 12

; 13

; 14

; 15
(define (dupli x)
  (cond
    [(empty? x) x]
    [(cons? x) (cons (first x (cons (first x (cons (dupli (rest x)) empty)))))]
))

   (check-expect (dupli '(a b c)) '(a a b b c c))
; 16

; 17

; 18

; 19

; 20

; 21

; 22

; 23

; 24

; 25

; 26

; 27
