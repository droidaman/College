;; Braden Licastro
;; Takes in code and outputs assembly.

#lang racket

(require "base.rkt")

(provide pass-to-asm)

; CONTRACT
;; input LOIDs -> String
(define (pass-to-asm input)
  (cond
    [(empty? input) (prog-end)]
    [(number? (id-value (first input)))
     (string-append (asm-num (first input)) (pass-to-asm (rest input)))
     ]
    [(binop? (id-value (first input)))
     (string-append (asm-binop (first input)) (pass-to-asm (rest input)))
     ]
    [(label? (id-value (first input)))
     (string-append (asm-label(first input)) (pass-to-asm (rest input)))
     ]
    [(goto? (id-value (first input)))
     (string-append (asm-goto (first input)) (pass-to-asm (rest input)))
     ]
    [(jump? (id-value (first input)))
     (string-append (asm-jump (first input)) (pass-to-asm (rest input)))
     ]
    [(symbol? (id-value (first input)))
     (string-append (asm-symbol (first input)) (pass-to-asm (rest input)))
     ]
    
    [else (error (format "~a" (first input)))]
    ))

; DONE CONTRACT
;; input Num ID -> String
(define (asm-num input)
  (string-append "SET " (stringify (id-sym input))
                 ", " (stringify (id-value input)) "\n"))

; DONE CONTRACT
;; input Sim ID -> String
(define (asm-binop input)
  (string-append "SET " (stringify "[" (add-symbol (newSym)) "]") ", " (stringify (binop-lhs (id-value input))) "\n"
                 "SET " (stringify "[" (add-symbol (newSym)) "]") ", " (stringify (binop-rhs (id-value input))) "\n"
                 (cond 
                   [(equal? '+ (binop-op (id-value input))) "ADD " 
                                                            (stringify (lookup (string->symbol 
                                                                     (string-append "sym" (sub1 (new-sym))))))
                                                            ", " 
                                                            (stringify (lookup (string->symbol
                                                                            (string-append "sym" (newSym))))) "\n"]
                   [(equal? '- (binop-op (id-value input))) "SUB randVar1, randVar2\n"])
                 "SET " (stringify (id-sym input)) ", randVar1\n"
                 ))

; DONE CONTRACT
;; input Label -> String
(define (asm-label input)
  (string-append ":" (stringify (label-sym (id-value input))) "\n")
  )

; DONE CONTRACT
;; input GoTo -> String
(define (asm-goto input)
  (string-append "SET PC, " (stringify (goto-sym (id-value input))) "\n")
  )

; CONTRACT
;; input Jump -> String
(define (asm-jump input)
  (let ([input (id-value input)])
    (cond
      [(variable? (jump-test input))
       (string-append "@" (stringify (variable-value (jump-test input))) "\n"
                      "D=M\n"
                      "@" (stringify (variable-value (jump-jumpdest input))) "\n"   
                      "D;" (stringify (jump-jumpsym input)) "\n")]
      [(num? (jump-test input))
       (string-append "@" (stringify (num-value (jump-test input))) "\n"
                      "D=A\n"
                      "@" (stringify (variable-value (jump-jumpdest input))) "\n"   
                      "A;" (stringify (jump-jumpsym input)) "\n")]
      [else (error (format "~a" input))]
      )))

; DONE CONTRACT
;; input Symbol -> String
(define (asm-symbol input)
  (string-append "SET " (stringify (id-sym input)) ", "
                 (stringify (id-value input)) "\n")
  )

; CONTRACT
;; input NumberorSymbol -> String
(define (stringify input)
  (cond
    [(number? input)(number->string input)]
    [else
     (symbol->string input)]))

; DONE CONTRACT
;; input Nothing -> String
(define (prog-end)
  ":end SET PC, end\n"
  )

;; Symbol table
(define table (make-hash))
(define sym-location 0)
(define new-sym 0)
(define (lookup sym)
  (if (hash-ref table sym (λ () false))
      (hash-ref table sym)
      (error "No symbol found: ~a~n" sym)))
;; Don't insert duplicates..
(define (add-symbol sym)
  (if (hash-ref table sym (λ () false))
      (lookup sym)
      (let ([current sym-location])
        (hash-set! table sym current)
        (set! sym-location (add1 sym-location))
        current
        )))

;;Make new symbols if we dont have one to begin with
(define (newSym)
  (set! new-sym (add1 new-sym))
  (string->symbol (string-append "sym" (stringify new-sym)))
  )