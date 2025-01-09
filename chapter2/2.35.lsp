Exercise 2.35: Redefine count-leaves from Section 2.2.2
as an accumulation:

(define (count-leaves t)
    (accumulate 
        (lambda (x y)
            (+ (cond 
                ((null? x) 0)
                ((not (pair? x)) 1)
                (else (count-leaves x))
            ) 
            y)) 
        0 
        t)
)

(define (count-leaves-short t)
    (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves x) 1)) t))
)


(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence))
        )
    )
)

(define (count-leaves-original x)
    (cond   ((null? x) 0)
            ((not (pair? x)) 1)
            (else (+ 
                    (count-leaves (car x)) 
                    (count-leaves (cdr x)))
            )
    )
)

