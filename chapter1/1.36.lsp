Exercise 1.36: Modify fixed-point so that it prints the
sequence of approximations it generates, using the newline
and display primitives shown in Exercise 1.22. Then find
a solution to x^x = 1000 by finding a fixed point of x →
log(1000)/ log(x ). (Use Scheme’s primitive log procedure,
which computes natural logarithms.) Compare the number
of steps this takes with and without average damping. (Note
that you cannot start fixed-point with a guess of 1, as this
would cause division by log(1)= 0.)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance)
    )

    (define (try guess i)
        (let ((next (f guess)))
        (display next) (display " ") (display i)
        (newline)

        (if (close-enough? guess next)
            next
            (try next (+ 1 i))))
    )

    (newline)
    (try first-guess 1)
)


(define (g)
    (define (f x)
        (/ (log 1000) (log x))
    )

    (fixed-point f 2)
)

(define (g2)
    (define (f x)
        (/ (+ x (/ (log 1000) (log x))) 2)
    )

    (fixed-point f 2)
)


