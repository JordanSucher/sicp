Exercise 2.79: Define a generic equality predicate equ? that
tests the equality of two numbers, and install it in the generic
arithmetic package. is operation should work for ordi-
nary numbers, rational numbers, and complex numbers.

(define (equ-pkg)
  (put 'equ? '(scheme-number scheme-number) =)
  (put 'equ? '(integer integer) =)
  (put 'equ? '(real real) =)
  (put 'equ? '(rational rational)
       (lambda (x y)
         (and (= (numer x) (numer y))
              (= (denom x) (denom y)))))
  (put 'equ? '(complex complex)
       (lambda (z1 z2)
         (and (= (real-part z1) (real-part z2))
              (= (imag-part z1) (imag-part z2))))))

(define (equ? x y) (apply-generic 'equ? x y))
