Exercise 2.83: Suppose you are designing a generic arith-
metic system for dealing with the tower of types shown in
Figure 2.25: integer, rational, real, complex. For each type
(except complex), design a procedure that raises objects of
that type one level in the tower. Show how to install a
generic raise operation that will work for each type (ex-
cept complex).


integer > rational > real > complex


(define (raise n)
  (apply-generic 'raise n)
)

(put 'raise '(scheme-number)
    (lambda (x) (make-rational x 1)) 
)

(put 'raise '(rational)
    (lambda (x) (make-real (inexact (/ (numer x) (denom x)))))  
)

(put 'raise '(real)
    (lambda (x) (make-complex-from-real-imag n 0)) ;
)
