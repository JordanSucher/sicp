Exercise 1.35: Show that the golden ratio ϕ (Section 1.2.2)
is a fixed point of the transformation x → 1 + 1/x , and
use this fact to compute ϕ by means of the fixed-point
procedure.


(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance)
    )

    (define (try guess)
        (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next)))
    )

    (try first-guess)
)


---

golden ratio: p^2 = p+1 

transformation: p = 1 + 1/p

(define (golden-rat)
    (define (f x)
        (+ 1 (/ 1 x))
    )
    (* 1.0 (fixed-point f 1))
)
