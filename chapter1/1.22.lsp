Exercise 1.22: Most Lisp implementations include a prim-
itive called runtime that returns an integer that specifies
the amount of time the system has been running (mea-
sured, for example, in microseconds). The following timed-
prime-test procedure, when called with an integer n, prints
n and checks to see if n is prime. If n is prime, the procedure
prints three asterisks followed by the amount of time used
in performing the test.


(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time)))
)

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time)
)

---


(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1))))
)

(define (divides? a b) (= (remainder b a) 0))


Using this procedure, write a procedure search-for-primes
that checks the primality of consecutive odd integers in a
specified range. Use your procedure to find the three small-
est primes larger than 1000, larger than 10,000, larger than
100,000, larger than 1,000,000. 

(define (search-for-primes n)
    (newline)
    (display n)
    (start-prime-search n (runtime) (list))
)

(define (start-prime-search n start-time primes)
    (cond 
        ((= (length list) 3) (report-primes primes start-time (runtime)))
        ((prime? n) (start-prime-search (+ 1 n) start-time (append primes (list n))))
        (else (start-prime-search (+ 1 n) start-time primes))
    )
)

(define (report-primes primes start-time end-time)
    (display primes)
    (display (- end-time start-time))
)


(define (prime? n)
    (= (find-divisor n 2) n)
)

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1))))
)

(define (square x)
    (* x x)
)

(define (divides? a b) (= (remainder b a) 0))



Note the time needed to test each prime. 
Since the testing algorithm has order of growth
of Θ(√n), you should expect that testing for primes around
10,000 should take about √10 times as long as testing for
primes around 1000. Do your timing data bear this out?
How well do the data for 100,000 and 1,000,000 support the
Θ(√n) prediction? Is your result compatible with the notion
that programs on your machine run in time proportional to
the number of steps required for the computation?
