Exercise 2.85: This section mentioned a method for “sim-
plifying” a data object by lowering it in the tower of types
as far as possible. Design a procedure drop that accom-
plishes this for the tower described in Exercise 2.83. The
key is to decide, in some general way, whether an object
can be lowered. For example, the complex number 1.5 + 0i
can be lowered as far as real, the complex number 1 + 0i
can be lowered as far as integer, and the complex number
2 + 3i cannot be lowered at all. Here is a plan for determin-
ing whether an object can be lowered: Begin by defining
a generic operation project that “pushes” an object down
in the tower. For example, projecting a complex number
would involve throwing away the imaginary part. Then a
number can be dropped if, when we project it and raise
the result back to the type we started with, we end up with
something equal to what we started with. Show how to im-
plement this idea in detail, by writing a drop procedure that
drops an object as far as possible. You will need to design
the various projection operations and install project as a
generic operation in the system. You will also need to make
use of a generic equality predicate, such as described in
Exercise 2.79. Finally, use drop to rewrite apply-generic
from Exercise 2.84 so that it “simplifies” its answers.


(define (project n)
  (apply-generic 'project n)
)

(put 'project '(rational)
     ;make integer
    (lambda (x) (make-integer (quotient (numer x) (denom x)))) 
)

(put 'project '(real)
     ;make rational
    (lambda (x) (let 
                    ((y (exact x)))
                    (make-rational 
                        (numerator y) 
                        (denominator y))
                )
    )  
)

(put 'project '(complex)
    (lambda (x) (make-real (real-part x))) ;
)

(define (drop x)
    (let ((projected (project x)))
        (let ((raised (raise projected)))
            (cond 
                ((or (not projected) (not raised)) x)
                ((equ? raised x) (drop projected))
                (else x)
            )   
        )
    )
)

(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (drop (apply proc (map contents args)))
                (let ((raised (raise-to args (parent type-tags))))
                    (if raised
                        (drop (apply-generic op raised))
                        (error "No method for these types and cannot raise"
                            (list op type-tags))
                    )
                )
            )
        )
    )
)
