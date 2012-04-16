#lang racket
(require rackunit)

;; PLEASE CHANGE THESE VALUES
(define USERNAME 'licastb)
(define DAY-OF-MONTH 21)
(define STARTTIME '("7:03" "PM"))
(define ENDTIME '("12:48" "AM"))

;; PLEASE LEAVE THESE TWO HELPERS ALONE.
;; THEY DEFINE A NEW SET-BASED EQUALITY CHECK.
(define (set-less-than? s1 s2)
  (andmap (lambda (elem) (member elem s2)) s1))
(define-binary-check (check-set-equal? s1 s2)
  (and (set-less-than? s1 s2)
       (set-less-than? s2 s1)))

;; -----------------------------------
;; Your code goes here.


;; ################# PART 2 - Processing Lists #####################

;; 1.
;;    define: list -> A list is either empty or followed by the rest of the list.

;; 2.
;; CONTRACT 
;; uniq :: list-of symbol -> list-of symbol 
;; PURPOSE 
;; Removes duplicates from a list, returning 
;; a new list with only one occurrence of each element. 
(define (uniq los)
  (cond
    [(empty? los) los]
    [(equal? (first los) (uniq (rest los))) (rest los)]
    [else
     (cons (first los) (rest los))]
    ))

(check-set-equal? (uniq '()) '())
(check-set-equal? (uniq (list 1 2 3)) (list 1 2 3))
(check-set-equal? (uniq (list 1 1 1)) (list 1))
(check-set-equal? (uniq (list 1 2 1)) (list 1 2))

;; 3.
;; mmap :: function list -> list
;; PURPOSE
;; Takes a function and a list, and applies
;; the function to each element of the list.
;; Returns a list containing the result of 
;; each of the function 
(define (mmap f loa)
  (cond
    [(equal? f even?)
     (cond
       [(empty? loa) loa]
       [(f (first loa)) (cons true (mmap f (rest loa)))]
       [else
        (cons false (mmap f (rest loa)))]
       )]
    [(equal? f add1)
     (cond
       [(empty? loa) loa]
       [(number? (first loa))(cons (f (first loa)) (mmap f (rest loa)))]
       )]
    [(equal? f number?)
     (cond     
       [(empty? loa) loa]
       [(f (first loa)) (cons true (mmap f (rest loa)))]
       [else
        (cons false (mmap f (rest loa)))]
       )]
    ))

(check-equal? (mmap even? '(1 2 3)) (list false true false))
(check-equal? (mmap add1 '(1 2 3)) '(2 3 4))
(check-equal? (mmap number? '(a 1 "hi")) (list false true false))

;; 4.
;; hyphenator :: list list -> list
;; PURPOSE
;; Given a list of two strings, hyphenate
;; the first string from the first list with 
;; the first stirng of the second, and so on.
;; The input lists will always be the same length.
(define (hyphenator los1 los2)
  (cond
    [(empty? los1) los1]
    [else
     (cons (string-append (first los1) "-" (first los2)) (hyphenator (rest los1) (rest los2)))]
    ))


(check-equal? (hyphenator '() '()) '())
(check-equal? (hyphenator (list "") (list "")) (list "-"))
(check-equal? (hyphenator (list "super" "wacky")
                          (list "fruit" "domo"))
              (list "super-fruit" "wacky-domo"))


;; ################# PART 3 - Understanding Functions #####################

;; 1.
;;    We need to interpret the body of the function in the environment that existed at the time of definition because
;;    it is possible to have an identifier in a later environmet that uses the same symbol as a previous envoronment.
;;    When we interpret the body of the function we may find this later identifier in the environment and if we use that
;;    to evaluate the body the result will be incorrect, thus we must use the original environment to ensure correct evaluation.
;;    (with (x 5) (* x (with (x 4) x)))
;;    As seen in the example above there are two different values for 'x'. If we always used the current environment to evaluate
;;    the statement (x 4) an incorrect result would be returned (16), but, if we used the environment at the time it was defined
;;    it would use both the environment (x 4) and (x 5) in the proper places and the correct result (20) would be returned.
;;    (Hope you don't mind me modifying the 'with' from question 3, was quicker to type out so I could work on part 4.)

;; 2.
;;    When we interpret a function the actual parameter should be evaluated at the same time as the function. The reason being
;;    that when we evaluate them at the same time the environment cannot be modified, plus, if the environment we are processing
;;    was captured we can use that at the same time as we process the function. This will allow us to use captured environments
;;    and interpret the functions correctly every time.

;; 3.
;;    The program (with (x 5) (+ x 3)) is equivalent to the program ((fun (x) (+ x 3)) 5) because they both evaluate to the same result.
;;    The first program uses substitution and replaces the 'x' in the (+ x 3) with its binding "5", which will come out as (+ 5 3). The
;;    other program uses functional interpretation, which the function when called, x is bound to the value "5" which is stored in an
;;    environment. When we interpret the body of the function the binding is found in the environment and we use the binding-body (the 5)
;;    in place of the 'x' and we will also get (+ 5 3) in this program too. In the end both of the programs evaluate to (+ 5 3) which is just 8.

;; 4.
;;    We cannot have free interpreters in the function body (for example (f (fun (z) (+ z y))) (f 6) ), but we are able to have free
;;    identifiers within the function definition as long as they are outside of the binding and the body, such as
;;    (f (fun (d) (+ d 1) y)) (f 5). The free identifier in this example is never evaluated so the interpreter just skims over
;;    it and doesn't throw an error.


;; ################# PART 4 - Interpretation #####################
;; ***** Sorry if I start to ramble toward the end of the problems, these became so repetative that I eventually
;;       started losing where I was in my text and it was also hard to describe using anything but similar sentences.

;; 1.
;;    The interpreter would execute the program first by binding the identity with 8 and interpreting the with. When the
;;    identifier (identity) is found after interpreting the contents of the with,the binding will be passed into the function.
;;    Once this happens the binding will be split into the number '8', which will then be bound with 'x' and the binding will
;;    will be placed into the environment. When the body of the function is interpreted the interpreter will find the identifier
;;    'x' and will search the environment for this, which it will find. The binding-body (8) will then be evaluated in the body
;;    of the funciton and the returned result would be the number 8.

;; 2.
;;    When this program is interpreted the first with will be interpreted. The function add1 will be tempoarily overlooked as
;;    there is a with nested inside the with that was just interpreted. When this with is interpreted the function add2 will be
;;    called with a parameter of add1 5. Because our interpreter interprets the code from the inside out add1 will be evaluated.
;;    When the function is called (x 5) will be added to the environment and the function body will then be evaluated. When this
;;    happens the identifier 'x' will be found and the environment will be searched for a matching binding. It will be found and
;;    the function will be evaluated with a result of 6, which when add2 is evaluated the result from the previous function
;;    evaluation (6) will be bound to y and placed in the environment. The environment now looks like '((y 6) (x 5)). When the
;;    body of add2 is evaluated the binding that matched y will be brought in and is sent back over to add1 and rebound to x. The
;;    environment now looks like '((x 6)(y 6)(x 5)). The add1 function will be evaluated with the current environment and the result
;;    of 7 will be returned back to add2, which still has a remaining add1 nested around the last returned result from the last time
;;    add1 was called. The last result (7) will be placed back into add1 again, which will ...once again... be rebound to x ...again
;;    and the environment will now look like '((x 7)(x 6)(y 6)(x 5)). The body will be evaluated again using the current environment
;;    which will return a value of 8 back to the add2 function, which has now been evaluated completely and will return the final value of 8.

;; 3.
;;    When this program is interpreted the first with statement will be interpreted and x will be bound to 3 and added to the environment.
;;    Once this is complete another with will be found and will be evaluated. Inside this with there is our first function, and another with.
;;    We will capture the binding x 3 now as it was the environment that was present at the time the add function was interpreted.This next
;;    with will be interpreted and we will have another x to bind, this time though it has the value of 5, so our environment will look like
;;    '((x 5)(x 3)). The environment x 5 will be captured by the addition that followed the binding as it was the environment that ws active
;;    at the time the addition was declared. Inside this addition is another with that will need to be interpreted. We find there is yet another
;;    binding in here so we will bind x to 0 and put that binding into the envireonment, which now looks like this: '(x 0)(x 5)(x 3)). There are
;;    more functions or withs remaining so we will start to interpret the functions and move towar the result. Inside that last with there was
;;    an x that needed a value. We will look for the first matching binding in the environment which happens to be the one we currently need,
;;    which is why that one wasn't captured for later use. Our addition will now look like (+ 0 (add x)) and the environment still looks like
;;    '(x 0)(x 5)(x 3)). We noe need to interpret the add x, but, because we have a captured environment for this function we need to use this
;;    binding from the environment that was applicable at the time the function was defined, which is (x 5). This will be bound to y once we
;;    interpret the add function and added to the environment, which will now look like this: '(y 5)(x 3)) (Remember, we are using the environment
;;    that was defined at the same time as the function so the (x 0) doesn't technically exist yet, and we are in an earlier environment even,
;;    now that we are in the add function, so (x 3) was the only item in the environment until we bound and added (y 5) to it.) Now we can step through
;;    and interpret the add function as our environment is up to date '(y 5)(x 3). The add function will add (+ y x) which is (+ 5 3) to get 8.
;;    The result will then be passed back into the addition which originally called the add function (Remember this: (+ 0 (add x))?) and the 
;;    addition will now look like (+ 0 8) which when interpreted will just evaluate to the number 8.


;; ################# PART 5 - Affirming and Extending Our Interpreter #####################

;; Create a syntax so that all structures have inspectors.
;; This does not need to be understood -- you still use the 
;; structures as normal. Note my code uses the short form, 
;; not the "make-" syntax.
(define-syntax istruct
  (lambda (stx)
    (syntax-case stx ()
      [(_ name (fields ...))
       #`(struct name (fields ...) #:inspector (make-inspector))])))

;; FWAE is a small language that we have developed over the 
;; course of a semester in CS220.
;;
;; <FWAE> ::= <num>
;;          | <id>
;;          | (+ <FWAE> <FWAE>)
;;          | (if0 <FWAE> <FWAE> <FWAE>)
;;          | (with (<id> <FWAE>) <FWAE>)
;;          | (fun (<id>) <FWAE>)
;;          | (<id> <FWAE>)
;;
;; Note binary operations only need to support + for time.

;; Structures required for an implementation of FWAE.
(istruct num (value))
(istruct id (name))
(istruct binop (op lhs rhs))
(istruct if0 (test true-expr false-expr))
(istruct with (binding body))
(istruct binding (id expr))
(istruct capture (id expr old-env))
(istruct fun-def (formal body))
(istruct fun-app (id actual))

;; ADT for Environments
;; make-empty-env :: (none) -> empty env
(define (make-empty-env) empty)

;; lookup :: id env -> capture
(define (lookup id env) 
  (cond
    [(empty? env) (error "Not found in env: " id)]
    [(equal? id (capture-id (first env))) (first env)]
    [else (lookup id (rest env))]))

;; extend-env :: capture env -> env
(define (extend-env c env)
  (cons c env))

;; CONTRACT
;; check-first? :: list symbol -> boolean
;; PURPOSE
;; Checks to see if the first element of the list
;; matches the symbol given.
(define (check-first? ls sym) 
  (equal? (first ls) sym))


;; 1.
;; CONTRACT
;; parse :: s-expressions -> FWAE
;; PURPOSE
;; Turns lists of symbols and numbers into structures
;; that are defined by the FWAE grammar. Assumes 
;; correct programs are fed into the parser.
(define (parse raw)
  (cond
    ;; Turn numbers in to num structures.
    [(number? raw) (num raw)]
    ;; Turn symbols into identifiers.
    [(symbol? raw) (id raw)]
    ;; If we see a list starting with 'with', it's a with.
    ;; Pull things apart and create a binding in the with.
    [(check-first? raw 'with)
     (with (binding (parse (first (second raw)))
                    (parse (second (second raw))))
           (parse (third raw)))]
    ;; If we see 'fun, it must be a function definition.
    [(check-first? raw 'fun)
     (fun-def (parse (first (second raw)))
              (parse (third raw)))]
    ;; BINOP
    [(equal? (first raw) '+)
     (binop (first raw) (parse (second raw)) (parse (third raw)))]
    ;; IF0
    [(equal? (first raw) 'if0)
     (if0 (parse (second raw)) (parse (third raw)) (parse (fourth raw)))]  
    ;; Otherwise, it is a function application.
    [else
     (fun-app (parse (first raw))
              (parse (second raw)))]))

;; ENVIRONMENTS
;; This interpreter passes an environment to evaluate 
;; bindings at time of use, as opposed to substituting
;; at time of binding.


;; 2.
;; CONTRACT
;; interp* :: FWAE env -> number?
;; PURPOSE
;; Interprets our code using environments. Consumes
;; an abstract syntax tree in the FWAE grammar and
;; an environment, and returns a Scheme number.
(define (interp* ast current-env)
  (cond
    ;; Return numbers that we find.
    [(num? ast) (num-value ast)]
    ;; Look up the identifier and interpret it 
    ;; in the environment that existed when it was bound.
    [(id? ast) 
     ;; Bind the capture so we can reference it easily.
     (let ([the-cap (lookup ast current-env)])
       (interp* (capture-expr the-cap)
                (capture-old-env the-cap))
       )]
    
    ;; INTERPRET BINOPS HERE
    [(binop? ast)
     (+ (interp* (binop-lhs ast) current-env)
        (interp* (binop-rhs ast) current-env)
        )]
    
    ;; INTERPRET IF0 HERE
    [(if0? ast)
     (cond
       [(zero? (interp* (if0-test ast) current-env))
        (interp* (if0-true-expr ast) current-env)
        ]
       [else (interp* (if0-false-expr ast) current-env)]
       )]
    
    [(with? ast)
     ;; let* is like nested let... this saves some indentation.
     (let* ([b (with-binding ast)]
            [id (binding-id b)]
            [val (binding-expr b)])
       ;; We interpret the body in an environment where we 
       ;; have extended the environment. But, we extend with a
       ;; capture, which preserves a copy of the current environment.
       (let* ([new-cap (capture id val current-env)]
              [extended-env
               (extend-env new-cap current-env)])
         (interp* (with-body ast) extended-env)
         ))]
    ;; If we find a fun-app, look up the identifier
    ;; to get the definition. Use that to bind the 
    ;; formal to the actual in the environment that existed
    ;; at time of definition; evaluate the function body
    ;; in that environment. We will, however, need to
    ;; evaluate the actual *first*, in the current environment.
    [(fun-app? ast)
     (let* ([evaled-actual (num (interp* (fun-app-actual ast)
                                         current-env))]
            [the-cap (lookup (fun-app-id ast) current-env)]
            [the-def (capture-expr the-cap)]
            [the-formal (fun-def-formal the-def)]
            [old-env (capture-old-env the-cap)]
            [extended-old (extend-env
                           (capture the-formal 
                                    evaled-actual
                                    old-env)
                           old-env)])
       (interp* (fun-def-body the-def) extended-old)
       )]
    
    ))

;; CONTRACT
;; unparse :: FWAE -> list
;; PURPOSE
;; Takes an AST (as produced by parse) and returns the 
;; original Scheme list that represented the code.
(define (unparse ast)
  (cond
    ;;Is it empty? That would be too easy...
    [(empty? ast) ast]
    
    ;;Is the AST a number? Unparse it.
    [(num? ast) (num-value ast)]
    
    ;; We have an ID, lets unparse it.
    [(id? ast) (id-name ast)]
    
    ;; Oooooh a with, better unparse it
    [(with? ast)
     (cons 'with (cons (unparse (with-binding ast)) (unparse (with-body ast))))
     ]
    
    ;; Gah, binops :-( Parse them :-)
    [(binding? ast)
     (cons (unparse (binding-id ast)) (binding-expr ast))
     ]
    
    ))

(check-equal? (unparse '()) '())
(check-equal? (unparse (num 8)) 8)
(check-equal? (unparse (id 'x)) 'x)
;; I was unable to finish the unparser with the remaining time I had. I spent too long trying to describe the problems
;; in section 4. I got the first three parts working alright but timed out with trying to ddebug the remainder of the code...
;(check-equal? (unparse (with (binding (id 'x) (num 8)) (id 'x))) '(with (x 8) x))
;(check-equal? (unparse (parse ’(with (x 3) x))) ’(with (x 3) x))

(define (interp ast)
  (interp* ast (make-empty-env)))

;; ------------------------------------
;; You should not need to modify the tests,
;; but you may want to uncomment some.

;; TESTS
;; CONTRACT
;; pass :: list number -> ?
;; PURPOSE
;; Runs the parser and interpreter on the expression,
;; and then uses the rackunit check-equal? to make sure
;; the result is equal to the expected value.
(define (pass exp expected)
  (check-equal? (interp (parse exp)) expected))

;; CONTRACT
;; not-pass :: list number -> ?
;; PURPOSE
;; Runs the parser and interpreter on the expression,
;; and then uses the rackunit check-not-equal? to make sure
;; the result is not equal to the expected value.
(define (not-pass exp expected)
  (check-not-equal? (interp (parse exp)) expected))

(define (throws-exn exp . expected)
  (check-exn exn:fail? 
             (λ () (interp (parse exp)))))

(pass '(with (x 8) x) 
      8)

(pass '(with (x 3) (with (y 5) y)) 
      5)

(pass '(with (f (fun (x) x)) 
             (f 8)) 
      8)

(pass '(with (x 3) (with (y x) y)) 3)

(pass '(with (x 3) 
             (with (f (fun (y) x)) 
                   (with (x 1000)
                         (f 5)))) 
      3)

(pass '(with (x 3) 
             (with (f (fun (x) x))
                   (f 5))) 5)

;; When you have binops, uncomment this block.
(pass '(with (x 3) (+ x 5)) 8)
(pass '(with (x 3) (+ x x)) 6)
(pass '(with (identity (fun (x) x)) (identity 8)) 8)
(pass '(with (double (fun (x) (+ x x))) (double 8)) 16)
(pass '(with (z 5) (with (f (fun (y) (+ z y))) 
                         (with (z 7) 
                               (+ z (f 9))))) 21)
(not-pass '(with (x 4) 
                 (with (f (fun (z) (+ x z))) 
                       (with (x 7) 
                             (+ x (f 3)))))
          17)
(pass '(with (x 4) 
             (with (f (fun (z) (+ x z))) 
                   (with (x 7) 
                         (+ x (f 3)))))
      14)
(pass '(if0 (+ -1 1) (+ 0 1) (+ 2 0)) 1)
(pass '(if0 (+ -3 1) (+ 0 1) (+ 2 0)) 2)

;; ################# PART 6 - Learning Outcomes: Self Evaluation #####################
;;  For the interpreters part of the course I have mixed feelings. From an understanding standpoint
;;  and being able to comprehend how the interpreters work, and how to get the final result I am perfect
;;  with. You would be able to write any code on the board and I would be able to figure out the environments
;;  and come to the right nswer every time, and quickly too, from a comprehension standpoint I believe I am at
;;  an A level. When it comes to coding and explaining things in writing I know what is going on, but I have trouble
;;  communicating it, as with many things, it just isn't a strong point with me. Coding I am able to complete the
;;  tasks, but it takes a little bit longer than I believe it should, though it is only 3/4 of a semester old for me
;;  and the way of thinking is relatively new to me (referring to new as in I'm 20 and have started thinking this way
;;  about two-three months ago). I believe I am at a B+ A- overall for code and explanation.