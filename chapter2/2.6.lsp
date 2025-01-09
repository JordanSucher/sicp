Exercise 2.6: In case representing pairs as procedures wasn’t
mind-boggling enough, consider that, in a language that
can manipulate procedures, we can get by without numbers
(at least insofar as nonnegative integers are concerned) by
implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x))))
)

This representation is known as Church numerals, afer its
inventor, Alonzo Church, the logician who invented the λ-
calculus.

Define one and two directly (not in terms of zero and add-
1). (Hint: Use substitution to evaluate (add-1 zero)). Give
a direct definition of the addition procedure + (not in terms
of repeated application of add-1).


(add-1 zero)
n = zero

(lambda (f) (lambda (x) (f ((zero f) x))))
    (zero f)
    (lambda (x) x)
(lambda (f) (lambda (x) (f x))) ; = one

(add-1 one)
n = one

(lambda (f) (lambda (x) (f ((one f) x))))
    (one f)
    (lambda (x) (f x))
(lambda (f) (lambda (x) (f (f x)))) ; = two

(define (add a b)
    (lambda (f) (lambda (x) ((m f) ((n f) x))))
)


