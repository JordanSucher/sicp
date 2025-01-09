Exercise 2.27: Modify your reverse procedure of Exercise
2.18 to produce a deep-reverse procedure that takes a list
as argument and returns as its value the list with its ele-
ments reversed and with all sublists deep-reversed as well.
For example,

(define x (list (list 1 2) (list 3 4)))

x
((1 2) (3 4))

(reverse x)
((3 4) (1 2))

(deep-reverse x)
((4 3) (2 1))

(define (deep-reverse x)
    (define (iter x reversed)
        (cond 
            ((null? x) reversed)
            ((list? (car x)) (iter (cdr x) (cons (deep-reverse (car x)) reversed)))
            (else (iter (cdr x) (cons (car x) reversed)))
        )
    )
    (iter x '())
)

(define (deep-reverse-terse x)
    (if (pair? x)
        (map deep-reverse-terse (reverse x))
        x
    )
)

(define (reverse xs)
  (define (iter xs ys)
    (if (null? xs)
        ys
        (iter (cdr xs)
              (cons (car xs) ys))))
  (iter xs '()))
