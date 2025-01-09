Exercise 2.4: Here is an alternative procedural representa-
tion of pairs. For this representation, verify that (car (cons
x y)) yields x for any objects x and y. What is the corresponding definition of cdr? 

(define (cons x y)
    (lambda (m) (m x y))
)

; (cons x y) returns a function that takes a function as an arg, then passes that function x and y

(define (car z)
    (z (lambda (p q) p))
)

; (car z) takes a function z, then passes that function another function which accepts 2 arguments and returns the first one

(define (cdr z)
    (z (lambda (p q) q))
)
