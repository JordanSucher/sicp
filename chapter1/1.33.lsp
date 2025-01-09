Exercise 1.33: You can obtain an even more general ver-
sion of accumulate (Exercise 1.32) by introducing the no-
tion of a filter on the terms to be combined. That is, combine
only those terms derived from values in the range that sat-
isfy a specified condition. The resulting filtered-accumulate
abstraction takes the same arguments as accumulate, to-
gether with an additional predicate of one argument that
specifies the filter. Write filtered-accumulate as a proce-
dure. 

(define (filtered-accumulate combiner null-value term a next b filter)
    (cond 
        ((> a b) null-value)
        ((not (filter a)) (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter))  )
        (else (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter)))
    )
)

Show how to express the following using filtered-
accumulate:

a. the sum of the squares of the prime numbers in the
interval a to b (assuming that you have a prime? pred-
icate already written)

(define (prime-squares-sum a b)
    (define (combiner x y)
        (+ x y)
    )
    (define (term a)
        (* a a)
    )
    (define (filter a)
        (if (prime? a)
        #t
        #f
        )
    )
    (define (next a)
        (+ a 1)
    )
    (filtered-accumulate combiner 0 term a next b filter)
)



(define (expmod base exp m)
    (cond
        ((= exp 0) 1)
        ((odd? exp) (remainder (* base (expmod base (- exp 1) m)) m))
        (else (remainder (test-square (expmod base (/ exp 2) m) m) m) )
    )
)

(define (test-square num m)
    (if
        (and
            (not (or (= num 1) (= num (- m 1))))
            (= (remainder num m) 1)
        )
        0
        (* num num)
    )
)

(define (prime? n)
    (define (iter base exp m)
        (cond 
            ((= base n) #t)
            ((= (expmod base exp m) 1) (iter (+ 1 base) exp m))
            (else #f)
        )
    )
    (iter 1 (- n 1) n)
)


b. the product of all the positive integers less than n that
are relatively prime to n (i.e., all positive integers i < n
such that GCD(i, n)= 1).

(define (filtered-accumulate combiner null-value term a next b filter)
    (cond 
        ((> a b) null-value)
        ((not (filter a)) (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter))  )
        (else (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter)))
    )
)

(define (gcd a b)
    (if (= 0 b)
        a
        (gcd b (remainder a b)))
)

(define (rel-prime-product n)
    (define (combiner x y) (* x y))
    (define (term a) a)
    (define (next a) (+ 1 a))
    (define (filter a)
        (if (= 1 (gcd a n))
            #t
            #f)
    )
    (filtered-accumulate combiner 1 term 1 next n filter)
)
