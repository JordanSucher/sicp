Exercise 3.33: Using primitive multiplier, adder, and con-
stant constraints, define a procedure averager that takes
three connectors a, b, and c as inputs and establishes the
constraint that the value of c is the average of the values of
a and b.


(define (averager a b c)
; c = (a + b) / 2
    (let 
        ((u (make-connector))
        (s (make-connector)))     
    (constant 2 u)
    (adder a b s)
    (multiplier c u s)
    )   
)
