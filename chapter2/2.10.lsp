Exercise 2.10: Ben Bitdiddle, an expert systems program-
mer, looks over Alyssa’s shoulder and comments that it is
not clear what it means to divide by an interval that spans
zero. Modify Alyssa’s code to check for this condition and
to signal an error if it occurs.


x = (2, 6), width = 4
y = (-2, 2), width = 4

z = (1/2, -1/2)

(mult x z)

((* 2 1/2) (* 2 -1/2) (* 6 1/2) (* 6 -1/2))
(1 -1 3 -3)
(-3, 3)



(define (div-interval x y)
    (define (div)
        (mul-interval
            x
            (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))
        )
    )
    (if (<= (lower-bound y) 0 (upper-bound y))
        "error"
        (div)
    )
)

(define (mul-interval x y)
    (let (  (p1 (* (lower-bound x) (lower-bound y)))
            (p2 (* (lower-bound x) (upper-bound y)))
            (p3 (* (upper-bound x) (lower-bound y)))
            (p4 (* (upper-bound x) (upper-bound y)))
        )
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4)))
)


