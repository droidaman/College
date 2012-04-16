;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname custom_datastructures) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.ss" "teachpack" "htdp")))))
(define-struct fruit (color taste shape texture))
;; make-fruit
;; fruit-color
;; fruit-taste
;; fruit-shape
;; fruit t-texture
;; fruit?

(define bradens-fruit
(make-fruit "white with blue stripe"
            "gasoline and blood"
            "reminiscent"
            "crumpled"))