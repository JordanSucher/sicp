Exercise 1.32:

a. Show that sum and product (Exercise 1.31) are both
special cases of a still more general notion called accumulate
that combines a collection of terms, using some gen-
eral accumulation function:

(accumulate combiner null-value term a next b)

accumulate takes as arguments the same term and
range specifications as sum and product, together with
a combiner procedure (of two arguments) that speci-
fies how the current term is to be combined with the
accumulation of the preceding terms and a null-value
that specifies what base value to use when the terms
run out. Write accumulate and show how sum and
product can both be defined as simple calls to accumulate


(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate combiner null-value term (next a) next b))
    )
)

(define (sum a b)
    (define (combiner x y) (+ x y))
    (define (next i) (+ 1 i))
    (define (term x) x)

    (accumulate combiner 0 term a next b)
)

(define (product a b)
    (define (combiner x y) (* x y))
    (define (next i) (+ 1 i))
    (define (term x ) x)

    (accumulate combiner 1 term a next b)
)

b. If your accumulate procedure generates a recursive
process, write one that generates an iterative process.
If it generates an iterative process, write one that gen-
erates a recursive process.

(define (accumulate combiner null-value term a next b)
    (define (iter result a)
        (if (> a b)
            result
            (iter (combiner result (term a)) (next a)))
    )
    (iter null-value a)
)
