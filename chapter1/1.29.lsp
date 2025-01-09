Exercise 1.29: Simpsons Rule is a more accurate method
of numerical integration than the method illustrated above.
Using Simpsons Rule, the integral of a function f between
a and b is approximated as

h/3 (y0 + 4y1 + 2y2 + 4y3 + 2y4 +···+ 2yn−2 + 4yn−1 + yn ),

where h= (b−a)/n, for some even integer n, and yk =
f (a + kh). (Increasing n increases the accuracy of the ap-
proximation.) Define a procedure that takes as arguments
f, a, b, and n and returns the value of the integral, com-
puted using Simpsons Rule. Use your procedure to inte-
grate cube between 0 and 1 (with n = 100 and n = 1000),
and compare the results to those of the integral procedure
shown above.



(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a) (sum term (next a) next b)))
)

(define (simpson-integral f a b n)    
    (define (y k)
        (f (+ a (* k (/ (- b a) n))))
    )
    (define (next k)
        (+ 1 k)
    )
    (define (term k)
        (cond ((or (= k 1) (= k n)) (y k))
              ((= (remainder k 2) 1) (* 4 (y k)))
              (else (* 2 (y k)))
        )
    )
    
    (* (/ (/ (- b a) n) 3) (sum term 0 next n))
)


(define (integral f a b dx)
    (define (add-dx x)
        (+ x dx)
    )
    (* (sum f (+ a (/ dx 2.0)) add-dx b) dx)
)



