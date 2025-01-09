; implement a cube-root procedure analagous to the square-root proc

; square-root 

(define (square x) (* x x))

(define (good-enough? previous-guess guess)
    (> (abs (- guess previous-guess)) (* .000001 * previous-guess))
)


(define (sqrt-iter guess x)
    (if (good-enough guess (improve guess x))
        guess
        (sqrt-iter (improve guess x) x)
    )
)
 

(define (improve guess x)
    (average guess (/ x guess))
)
  

(define (average x y)
(/ (+ x y) 2))
 

(define (sqrt x)
    (sqrt-iter 1 x)
)

; ----


(define (cube x) (* x x x))

(define (square x) (* x x))


(define (good-enough? previous-guess guess)
    (> (abs (- guess previous-guess)) (* .000001 * previous-guess))
)


(define (cbrt-iter guess x)
    (if (good-enough guess (improve guess x))
        guess
        (cbrt-iter (improve guess x) x)
    )
)
 

(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3)
)
  

(define (cbrt x)
    (cbrt-iter 1 x)
)

  