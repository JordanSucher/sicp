Exercise 1.27: Demonstrate that the Carmichael numbers
listed in Footnote 1.47 really do fool the Fermat test. That is,
write a procedure that takes an integer n and tests whether
a^n is congruent to a modulo n for every a < n, and try your
procedure on the given Carmichael numbers.



(define (fermat-test n)
    (define (iter base exp m)
        (cond 
            ((= base n) #t)
            ((= (expmod base exp m) base) (iter (+ 1 base) exp m))
            (else #f)
        )
    )
    (iter 1 n n)
)


(define (expmod base exp m)
    (cond
        ((= exp 0) 1)
        ((odd? exp) (remainder (* base (expmod base (- exp 1) m)) m))
        (else (remainder (square (expmod base (/ exp 2) m)) m) )
    )
)


(define (square x)
    (* x x)
)

