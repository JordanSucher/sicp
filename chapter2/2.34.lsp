Exercise 2.34: Evaluating a polynomial in x at a given value
of x can be formulated as an accumulation. We evaluate the
polynomial

anx^n + an−1x^n−1 +···+ a1x + a0

using a well-known algorithm called Horner’s rule, which
structures the computation as

(. . . (an x + an−1)x +···+ a1)x + a0.

In other words, we start with an , multiply by x , add an−1,
multiply by x , and so on, until we reach a0.

Fill in the following template to produce a procedure that
evaluates a polynomial using Horner’s rule. Assume that
the coeﬃcients of the polynomial are arranged in a sequence,
from a0 through an.

(define (horner-eval x coefficient-sequence)
    (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
                0
                coefficient-sequence
    )
)

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence))
        )
    )
)


