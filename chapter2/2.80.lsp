Exercise 2.80: Define a generic predicate =zero? that tests
if its argument is zero, and install it in the generic arith-
metic package. This operation should work for ordinary
numbers, rational numbers, and complex numbers.



(define (=zero-pkg)
  (put '=zero? '(scheme-number) (lambda (x) (= 0 x)))
  (put '=zero? '(integer) (lambda (x) (= 0 x)))
  (put '=zero? '(real) (lambda (x) (= 0 x)))
  (put '=zero? '(rational)
       (lambda (x)
         (and (= (numer x) 0)
              (not (= (denom x) 0)))))
  (put '=zero? '(complex)
       (lambda (z1)
         (and (= (real-part z1) 0)
              (= (imag-part z1) 0)))))

(define (=zero? x y) (apply-generic 'equ? x y))
