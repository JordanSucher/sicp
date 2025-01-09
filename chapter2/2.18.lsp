Exercise 2.18: Define a procedure reverse that takes a list
as argument and returns a list of the same elements in re-
verse order:

(1 2 3 4)

(define (reverse l)
    (if (= 0 (length (cdr l)))
        (list (car l))
        (append (reverse (cdr l)) (list (car l)))
    )
)

; iterative

(define (reverse xs)
  (define (iter xs ys)
    (if (null? xs)
        ys
        (iter (cdr xs)
              (cons (car xs) ys))))
  (iter xs '()))

