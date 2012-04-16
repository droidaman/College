;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname licastro-lab3) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.ss" "teachpack" "htdp")))))
(define (slice ls s e)
  (cond
    [(empty? ls) empty]
    [(and (zero? s)(> e 0))
     (cons (first ls)
           (slice (rest ls) 0 (- e 1)))]
    [(> s 0)
     (slice (rest ls) (- s 1) e)]
    [(and (zero? s)(zero? e)) empty]
    ))



(define (rl-helper input building)
  (cond
    [(empty? input) building]
    [(cons? input)
     (rl-helper(rest input)
               (cons (first input) building))]
    
    ))

(define (reverse-list ls)
  (rl-helper ls empty))