Exercise 1.28: One variant of the Fermat test that cannot be fooled is called the Miller-Rabin test 
(Miller 1976 Rabin 1980). This starts from an alternate form of Fermat’s Little Theorem, which 
states that if n is a prime number and a is any positive integer less than n, then a raised to the (n−1)st
power is congruent to 1 modulo n. 

To test the primality of a number n by the Miller-Rabin test, we pick a random number a < n 
and raise a to the (n−1)st power modulo n using the expmod procedure. 

However, whenever we perform the squaring step in expmod, we check to see if we have discovered 
a “nontrivial square root of 1 modulo n,” that is, a number not equal to 1 or n−1 whose square is equal to 1 modulo n. 

It is possible to prove that if such a nontrivial square root of 1 exists, then n is not prime.        

It is also possible to prove that if n is an odd number that is not prime, then, for at least 
half the numbers a < n, computing a^n−1 in this way will reveal a nontrivial square root of 1 modulo n. 
(This is why the Miller-Rabin test cannot be fooled.)

Modify the expmod procedure to signal if it discovers a nontrivial square root of 1, and use this to implement 
the Miller-Rabin test with a procedure analogous to fermat-test. Check your procedure by testing various known primes and non-primes.
Hint: One convenient way to make expmod signal is to have it return 0.


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

(define (miller-test n)
    (define (iter base exp m)
        (cond 
            ((= base n) #t)
            ((= (expmod base exp m) 1) (iter (+ 1 base) exp m))
            (else #f)
        )
    )
    (iter 1 (- n 1) n)
)

(miller-test 3)
(iter 1 2 3)
    ((= (expmod 1 2 3) 1) (iter 2 2 3))
        (expmod 1 2 3)
            (remainder (test (square (expmod 1 1 3)) m) m)
                (expmod 1 1 3)
                    (remainder (* 1 (expmod 1 0 3)) 3)
                        (expmod 1 0 3) ; = 1
                    (remainder (* 1 1) 3) ; = 1
                (expmod 1 1 3) ; = 1
            (remainder (test (square 1) 3) 3)
                (test 1 3) ; = 1
            (remainder 1 3) ; = 1
        (expmod 1 2 3) ; = 1
    ((= 1 1) (iter 2 2 3))
(iter 2 2 3)
    ((= (expmod 2 2 3) 1) (iter 3 2 3))
        (expmod 2 2 3)
            (remainder (test (square (expmod 2 1 3)) 3) 3)
                (expmod 2 1 3)
                    (remainder (* 2 (expmod 2 0 3)) 3)
                        (expmod 2 0 3) ; = 1
                    (remainder 2 3) ; = 2
                (expmod 2 1 3) ; = 2
            (remainder (test (square 2) 3) 3)
                (test 4 3) ; = 0
            (remainder 0 3) ; = 0
        (expmod 2 2 3) ; = 0
    ((= 0 1) (iter 3 2 3)) ; #f
    

;--- naive solution

(define (test base exp m)
 (if (= (remainder (expt base exp) m) 1)
    #t
    #f
 )
)

(define (miller-test n)
    (define (iter base exp m)
        (cond 
            ((= base n) #t)
            ((test base exp m) (iter (+ 1 base) exp m))
            (else #f)
        )
    )
    (iter 2 (- n 1) n)
)

