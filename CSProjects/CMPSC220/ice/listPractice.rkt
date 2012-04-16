;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname listPractice) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.ss" "teachpack" "htdp")))))
;; Append a list of strings

;; CONTRACT
;; collider : list-of string -> string
;; PURPOSE
;; Combine the strings... as discussed...
(define (collider los)
  (cond
    [(empty? los) ""]
    [(cons? los)
     (string-append
      (first los)
     (collider (rest los)))]))

;; TESTS
(check-expect (collider empty) "")
              
(check-expect (collider (cons "hello" empty))
              "hello")