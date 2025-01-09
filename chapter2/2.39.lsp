Exercise 2.39: Complete the following definitions of reverse
(Exercise 2.18) in terms of fold-right and fold-left from
Exercise 2.38:


(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence))
        )
    )
)

(define (reverse sequence)
    (fold-right (lambda (x y) (if (pair? y) (append y (list x)) (list x))) '() sequence)
)

(define (reverse sequence)
    (fold-left (lambda (x y) (append (list y) x)) '() sequence)
)
