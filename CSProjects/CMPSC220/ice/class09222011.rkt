;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname class09222011) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.ss" "teachpack" "htdp")))))
;; An onion is
;; -- a color isa string
;; --an ogre isa(n) onion
(define-struct onion (color ogre))
;;           onion-color^     ^onion-ogre
;;also, 'make-onion'

(define-struct onion-core ())
;; make-onion-core
;; onion-core?

;; A list is either
;; -- empty
;; -- (cons item list)
;;           ^     ^
;;           |     |
;;         first   |
;;                rest

(define (process-onion o)
  (cond
    [(onion-core? o ...)]
     [else ...
      ... (onion -color o) ...
      ... (process-onion (onion-ogre o)) ...
      ]))

;;Develop a function that consumes a list of numbers and returns a list of the squares of each of those numbers.

;; PURPOSE
;; It was assigned, you have to do it. Help me!!!
;; CONTRACT
;; square-all: (list-of num) -> (list-of num)
(define (square-all ls)
  (cond
    ;;Is it empty?
    [(empty? ls) empty]
    ;;Is it a list?
    [(cons? ls)
     ;;This is a number
     (cons (sqr (first ls))
     ;;This is a list of numbers
     (square-all (rest ls)))
     ]))

;EXAMPLE
(check-expect (square-all '( 1 2 3))
              '(1 4 9))