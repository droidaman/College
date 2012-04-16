;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname test1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Braden Licastro
;; ST: 9:45PM UTC-5
;; ET: 11:40PM UTC-5
;; 09.18.2011

;; CONTRACT
;; vowel? : character -> boolean
;; PURPOSE
;; Returns true if the given character is a vowel.
;; This function must be placed in your code somewhere
;; before the point it is used.
(define (vowel? ch)
  (member ch (list #\A #\a #\E #\e #\I #\i #\O #\o #\U #\u)))
(check-expect (vowel? #\A) true)
(check-expect (vowel? #\z) false)

; 2.1
;; PURPOSE
;; Calculates the distance from the progin to the given point using the pythagorean theorem.
;; CONTRACT
;; pythag: int -> int
(define (pythag x y)
  (+ (expt x 2) (expt y 2)))

(check-expect (pythag 2 3) 13)

; 2.2
;; PURPOSE
;; Computes the distance between the origin and the point x,y measured by a walk
;; CONTRACT
;; manhatten: int -> int
(define(manhatten x y)
  (+ (if (>= x 0) x (- x)) (if (>= y 0) y (- y))))
(check-expect (manhatten 2 3) 5)
(check-expect (manhatten -2 -3) 5) 

; 2.3
;; PURPOSE
;; Returns the symbol ’faster if it is faster to take the Pythagorean path, ’slower if it is quicker to take the Manhattan route, and ’same if they are equivalent
;; CONTRACT
;; pythag-faster: int -> symbol
(define (pythag-faster x y)
  (cond
    [(> (manhatten x y) (pythag x y)) 'slower]
    [(< (manhatten x y) (pythag x y)) 'faster]
    [(= (manhatten x y) (pythag x y)) 'same]
    ))
(check-expect (pythag-faster 1 1) 'same)
(check-expect (pythag-faster 2 3) 'faster)
(check-expect (pythag-faster 1 1) 'same)

; 2.4
;; Not sure of the name of the convention it violates, but I believe you aren't supposed to "hyphonate" a function name.

; 3.1
;;; (define name (value))

; 3.2
;;; (define (funName params) body)

; 3.3
;;; (cond
;;;   [(boolenOperator item1 item2) actionIfTrue]
;;; )

; 3.4
;;; (if (booleanOperator item1 item2) trueResult falseResult)

; 3.5
;;; (define-struct name (values))

; 4.1
;; CONTRACT
;; fruit: number boolean -> fruit
(define-struct fruit (name tasty juicy?))

; 4.2
;; CONTRACT
;; bagel: string boolean -> bagel
(define-struct bagel (flavor toasted))

; 4.3
;; CONTRACT
;; ice-cream: string number -> ice-cream
(define-struct ice-cream (maker intensity))

; 5.1
;; PURPOSE
;; Returns true if the ice cream is intense (> 11) and the fruit is tasty (> 42)
;; CONTRACT
;; intense-n-tasty: fruit ice-cream -> boolean 
(define (intense-n-tasty f ic)
  (cond
    [(boolean=? (> (fruit-tasty f) 42) (> (ice-cream-intensity ic) 11)) true]
  ))
(check-expect (intense-n-tasty (make-fruit lolberry 42 false) (make-ice-cream "braden" 1024)) true)

; 5.2
;; PURPOSE
;; Returns true if the ice cream is made by casey.
;; CONTRACT
;; caseys?: ice-cream -> boolean
(define (caseys? ic)
  (cond
    [(string=? (ice-cream-maker ic) "casey") true]
  ))
(check-expect (caseys? (make-ice-cream "casey" 1024)) true)

; 5.3
;; PURPOSE
;; Return a sandwich name that combines the names of all three of the given ingredients.
;; CONTRACT
;; sandwich-name?: fruit bagel ice-cream -> string
(define (sandwich-name f b ic)
  (string-append (fruit-name f) " " (bagel-flavor b) " " (ice-cream-maker ic)))
(check-expect (sandwich-name (make-fruit "lolzberry" 63 true) (make-bagel "minty" false) (make-ice-cream "caseysss" 1234)) "lolzberry minty caseysss")

; 5.4
;; PURPOSE
;; Will professor roos like what he is given
;; CONTRACT
;; caseys?: unknown structure -> string
(define (roos-worthy whatsIt)
  (cond
    [(boolean=? (bagel-toasted whatsIt) true) true]
    [(> (ice-cream-intensity whatsIt) 11) true]
    [(vowel? (string-ref (fruit-name whatsIt) 0)) true]
   ))
(check-expect (roos-worthy (make-bagel "blacktop" true)) true)
(check-expect (roos-worthy (make-ice-cream "some lady" 12)) true)
(check-expect (roos-worthy (make-fruit "apple" 234 false)) true)