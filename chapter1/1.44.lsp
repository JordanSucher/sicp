Exercise 1.44: e idea of smoothing a function is an important concept in signal processing. 
If f is a function and dx is some small number, then the smoothed version of f is the function 
whose value at a point x is the average of f (x−dx ), f (x), and f(x+dx). Write a procedure 
smooth that takes as input a procedure that computes f and returns a procedure that computes the smoothed f.
It is sometimes valuable to repeatedly smooth a function (that is, smooth the smoothed function, and so on) 
to obtain the n-fold smoothed function. Show how to generate the n-fold smoothed function of any given function 
using smooth and repeated from Exercise 1.43.


(define (repeated f n)
    (if (= n 1)
        (lambda (x) (f x))
        (repeated (double f) (- n 1))
    )
)

(define (smooth f)
    (let ((dx 0.001))
        (lambda (x)
            (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)
        )
    )
)

(define (nth-smoothed f n)
    (repeated (smooth f) n)
)
