Exercise 2.8: Using reasoning analogous to Alyssa’s, de-
scribe how the diﬀerence of two intervals may be com-
puted. Define a corresponding subtraction procedure, called
sub-interval.



(define (sub-interval x y)
    (make-interval
        (- (lower-bound x) (upper-bound y))
        (- (upper-bound x) (lower-bound y))
    )
)

---

(define (make-interval a b) (cons a b))

(define (add-interval x y)
    (make-interval 
        (+ (lower-bound x) (lower-bound y))
        (+ (upper-bound x) (upper-bound y))
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

(define (div-interval x y)
    (mul-interval
        x
        (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))
    )
)

(define (lower-bound x)
    (car x)
)

(define (upper-bound x)
    (cdr x)
)
