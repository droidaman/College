;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |ex 9-27|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;;1a.
(define message
  '(oh ((there once)
        (was (a))
        man (from (nantucket))))
  )

(define (message-a message)
  (second (second message))
  )

(check-expect (message-a message) '(was (a)))

;;1b.
(define (message-b)
  (first (second (message-a message)))
  )

                    
(check-expect (message-b) 'a)
  
;;1c.
(define (message-c message)
  (first (fourth (second message)))
  )

(check-expect (message-c message) 'from)

;;2.
(define (build-message)
  (cons (cons 'was (cons (cons 'a empty) empty)) (cons 'man empty))
  )

(check-expect (build-message) '((was (a)) man))


;;3.rop
;;CONTRACT
;;ice-cream-flavor-maker : (list of 4 symbols) -> (list of (list of symbols))
(define (ice-cream-flavor-maker los)
  (cons (cons (first los) (cons (second los) empty)) (cons (cons (third los) (cons (fourth los) empty)) empty))
  )

(check-expect (ice-cream-flavor-maker '(the amazing chocolate fudge)) '((the amazing) (chocolate fudge)))

;; 4.
;; CONTRACT
;; all-divisible-by? number, list of numbers -> boolean
(define (all-divisible-by? x ls)
  (cond
    [(empty? ls) true]
    [(cons? ls)
      (and (= (modulo (first ls) x) 0)
      (all-divisible-by? x (rest ls)) true)]
    ))

(check-expect (all-divisible-by? 3 empty) true)
(check-expect (all-divisible-by? 5 '(10 20)) true)

;; 5.
;; CONTRACT
;; all-lists? : list(maybe list of lists) -> boolean
(define (all-lists? ls)
  (cond
    [(empty? ls) true]
    [(cons? (first ls)) (all-lists? (rest ls))]
    [else
     false]
   ))

(check-expect (all-lists? '((a b) (c d))) true)
(check-expect (all-lists? '((a b) c)) false)

;; 6.
;; CONTRACT
;; only-symbols : list of symbols -> boolean
(define (only-symbols dlos)
  (cond
    [(empty? dlos) true]
    [(symbol? (first dlos))
     (only-symbols (rest dlos))]
    [(cons? (first dlos))
     (and (only-symbols (first dlos))
          (only-symbols (rest dlos)))]
    ))

(check-expect (only-symbols '(a b c)) true)
(check-expect (only-symbols '(a (b) c)) true)
(check-expect (only-symbols '((the amazing) (chocolate fudge))) true)

;; 7.
;; CONTRACT
;; reverse-list : list -> list
(define (reverse-list ls)
  (cond
    [(empty? ls) empty]
    [(cons? ls)
     (append (reverse-list (rest ls))
                           (cons (first ls) empty))]
    ))

(check-expect (reverse-list '(1 2 3)) '(3 2 1))

;; 8.
;; CONTRACT
;; append-lists : list, list -> list
(define (append-lists ls1 ls2)
  (append ls1 ls2)
  )

(check-expect (append-lists '(1 2 3) '(4 5 6)) '(1 2 3 4 5 6))

;; 9.
;; CONTRACT
;; palindrome? : list -> boolean
(define (palindrome? ls)
     (pali-helper ls (reverse-list ls))
  )

(define (pali-helper ls1 ls2)
  (cond
    [(empty? ls1) true]
    [(equal? (first ls1) (first ls2)) (pali-helper (rest ls1) (rest ls2))]
    [else
     false]
    ))

(check-expect (palindrome? '(x p e d e x p)) false)
(check-expect (palindrome? '(x p e d p e x)) false)
(check-expect (palindrome? '(x p e d e p x)) true)


;; 10.
;; CONTRACT
;; flat : list of symbols -> flattened list
(define (flat dlos)
  (cond
    [(empty? dlos) empty]
    [(symbol?  (first dlos)) (cons (first dlos) (flat (rest dlos)))]
    [(cons? (first dlos))
     (append (flat (first dlos)) (flat (rest dlos)))]))

(check-expect (flat '(a (b c (d e)) f (g))) '(a b c d e f g))

;; 11.
;; CONTRACT
;; fact : number -> number
(define (fact x)
  (cond
    [(zero? x) 1]
    [else (* x (fact (- x 1)))]
    ))

(check-expect (fact 5) 120)

;; 12.
;; CONTRACT
;; compress : list -> list
(define (compress los)
  (cond
    ;; Empty lists need no compression
    [(empty? los) empty]
    ;; If we have a list of length one,
    ;; we do not need to compress further
    [(empty? (rest los)) los]
    ;; If the first and second elements the same?
    ;; If so, drop the first one.
    [(equal? (first los) (first (rest los)))
     (compress (rest los))]
    ;; Otherwise, keep the first thing. It is
    ;; not a repetition.
    [else
     (cons (first los)
           (compress (rest los)))]
    ))

(check-expect (compress '(a a a a b c c a a d e e e e)) '(a b c a d e))
(check-expect (compress '()) '())

;; 15.
;; CONTRACT
;; dupli : list -> list
(define (dupli ls)
  (cond
    [(empty? ls) empty]
    [(cons? ls) (cons (first ls) (cons (first ls) (dupli (rest ls))))]
    ))

(check-expect (dupli '(a b c)) '(a a b b c c))

;; 16.
;; CONTRACT
;; repli: list, int -> list
(define (repli ls num)
  (cond
    [(empty? ls) empty]
    [(= num 0) ls]
    [else
     (append (repli-helper (first ls) num) (repli (rest ls) num))]
  ))

(define (repli-helper ls num)
  (cond
    [(= num 0) empty]
    [else
     (cons ls (repli-helper ls (- num 1)))]
    ))

(check-expect (repli '(a b c) 3) '(a a a b b b c c c))
(check-expect (repli '() 123456) '())
(check-expect (repli '(a b c d e) 0) '(a b c d e))

;; 17.
;; CONTRACT
;; drop : list, int -> list
(define (drop ls num)
  (cond
    [(empty? ls) empty]
    [(= num 0) ls]
    [else
     (drop-helper ls num 1)]
    ))
  
(define (drop-helper ls num ctr)
  (cond
    [(empty? ls) empty]
    [(= ctr num) (drop-helper (rest ls) num 1)]
    [else
     (cons (first ls) (drop-helper (rest ls) num (+ ctr 1)))]
    ))
 
(check-expect (drop '(a b c d e f g h i) 3) '(a b d e g h))
(check-expect (drop '() 225) '())
(check-expect (drop '(a b c d e f g) 0) '(a b c d e f g))
(check-expect (drop '(a b c 1 2 3) 10) '(a b c 1 2 3))

;; 18.
;; CONTRACT
;; slice : list, int, int -> list
(define (slice ls s e)
  (cond
    [(empty? ls) empty]
    [(and (zero? s)(> e 0))
     (cons (first ls)
           (slice (rest ls) 0 (- e 1)))]
    [(> s 0)
     (slice (rest ls) (- s 1) (- e 1))]
    [(and (zero? s)(zero? e)) (cons (first ls) empty)]
    ))

(check-expect (slice '(a b c d e f g) 3 5) '(d e f))
(check-expect (slice '() 2 5) '())

;; 19.
;; CONTRACT
;; checked-slice : list, int, int -> boolean
(define (checked-slice ls s e)
  (cond
    [(and (and (not (zero? s)) (not (zero? e))) (empty? ls)) false]
    [(and (< s (length ls)) (> e (length ls))) false]
    [else
     (slice ls s e)]
    ))

(check-expect (checked-slice '(a b c d e f g) 3 5) '(d e f))
(check-expect (checked-slice '(a b c d e f g) 3 10) false)
(check-expect (checked-slice '() 3 10) false)



;;-----------------------------------------------
;; CONTRACT
;; squeeze : string string -> string
;;(define (squeeze s1 s2)
 ;; (list->string
   ;;(sq-help (string->list s1)
     ;;       (string->list s2))))

;; CONTRACT
;; sq-help : (list of char) (list of char) -> (list of char)
;;(define (sq-help ls1 ls2)
  
 ;; )