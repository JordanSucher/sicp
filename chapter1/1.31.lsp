Exercise 1.31:

a. The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order 
procedures. Write an analogous procedure called product that returns the product of the values of a
function at points over a given range. Show how to define factorial in terms of product. Also use product
to compute approximations to π using the formula:

pi / 4 = 2/3 * 4/3 * 4/5 * 6/5 * 6/7 * 8/7

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a) (sum term (next a) next b)))
)

; recursive solution

(define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))
    )
)

(define (factorial x)
    (define (next i)
        (+ 1 i)
    )
    (define (identity n) n)
    (product identity 1 next x)
)

(define (pi-approximation n)
    (define (next i) (+ 1 i))
    (define (numerator i)
        (cond 
            ((= 1 (remainder i 2)) (+ i 1))
            ((= 0 (remainder i 2)) (+ i 2))
        )
    )
    (define (denominator i)
        (cond
            ((= 1 (remainder i 2)) (+ i 2))
            ((= 0 (remainder i 2)) (+ i 1))
        )
    )
    (define (term i)
        (/ (numerator i) (denominator i))
    )
    (* 4.0 (product term 1 next n))
)

b. If your product procedure generates a recursive pro-
cess, write one that generates an iterative process. If
it generates an iterative process, write one that gen-
erates a recursive process.

; iterative

(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))
        )
    )
    (iter a 1)
)
