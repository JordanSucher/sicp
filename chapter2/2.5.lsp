Exercise 2.5: Show that we can represent pairs of nonneg-
ative integers using only numbers and arithmetic opera-
tions if we represent the pair a and b as the integer that is
the product 2^a 3^b . Give the corresponding definitions of the
procedures cons, car, and cdr.


(define (cons a b)
    (* (expt 2 a) (expt 3 b))
)

(define (car p)
    (define (iter n count)
        (if (= 0 (remainder n 2))
            (iter (/ n 2) (+ 1 count))
            count
        )
    )
    (iter p 0)
)

(define (cdr p)
    (define (iter n count)
        (if (= 0 (remainder n 3))
            (iter (/ n 3) (+ 1 count))
            count
        )
    )
    (iter p 0)
)
