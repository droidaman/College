;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname licastro-lab2) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.ss" "teachpack" "htdp")))))
;;Braden Licasto & Trent Dale
;;CMPSC220
;;LAB 2

;;CONTRACT
;;suit : string -> string
;;rank : int -> string
(define-struct card (suit rank))

;;CONTRACT
;;name : string -> string
;;snark-rank : int -> string
(define-struct student (name snark-rank))

;;CONTRACT
;;no params...
(define-struct domo())

;;CONTRACT
;;params : no specified type
(define-struct fun (params body))

;;CONTRACT
;;empty-node : node -> node
(define-struct empty-node ())

;; 1. You can work with structures
;;        in ways that differ from a
;;        list. Such as evaluating
;;        functions from within a structure.
;;
;; 2. A:  
;;          (define-struct fun-app(name args body))
;;    B:  
;;          (define-struct fun-app(name args))
;;    C:  
;;          (define-struct if-struct(test-exp false-exp true-exp))


;;STRUCTURE PRACTICE

;  1.
;; CONTRACT
;; pit : int -> int
(define-struct pit (hours minutes seconds))

(define (time-diff t1 t2)
  (- (+ (* (pit-hours t2) 3600) (* (pit-hours t2) 60) (pit-seconds t2)) (+ (* (pit-hours t1) 3600) (* (pit-hours t1) 60) (pit-seconds t1))))

;  2.
;; CONTRACT
;; name points : string, int -> game-score
(define-struct game-score (name points))

;  3.
;; CONTRACT
;; g1, g2 : game-score -> string
(define (game-scores g1 g2)
  (cond
    [(= (game-score-points g1) (game-score-points g2)) 'Tie]
    [(< (game-score-points g1) (game-score-points g2)) (game-score-name g2)]
    [(> (game-score-points g1) (game-score-points g2)) (game-score-name g1)]))

;  4.
;; CONTRACT
;; posn : x, y
(define-struct position (x y))

;  5.
;; CONTRACT
;; circ : position, radius -> circ
;; square : position, length -> square
;; rect : position, width, length -> rect
;; area : shape -> int
(define-struct circ (position radius))
(define-struct square (position length))
(define-struct rect (position width length))
(define (area shape)
  (cond
    [(circ? shape) (* pi (* (circ-radius shape) (circ-radius shape)))]
    [(square? shape) (* (square-length shape) (square-length shape))]
    [(rect? shape) (* (rect-width shape) (rect-length shape))]))

;  6.
;; CONTRACT
;; in-shape : shape, position -> boolean

;; I'll be honest... I have NO CLUE what is going on in this one... what would the math even be?
(define (in-shape shape position)
  (cond
    [(<= position shape) true]
    [else false]))