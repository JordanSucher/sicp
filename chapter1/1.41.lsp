Exercise 1.41: Define a procedure double that takes a procedure of one argument as argument and returns a 
procedure that applies the original procedure twice. For example, if inc is a procedure that adds 1 to its argument, 
then (double inc) should be a procedure that adds 2. What value is returned by

(((double (double double)) inc) 5)

- if double takes a function f and returns a function g that applies f twice,
then (double double) returns:  

(lambda (x) (double (double x))) 

- then, that is passed to double AGAIN, so we get: 

(lambda (x) (double (double (double (double x)))))

- then we pas in inc, so we get

(lambda (x) (double (double (double (double (inc x))))))

- then we pass in 5, so...

(double (double (double (double (inc 5)))))

- so 2^4 + 5 = 21

---

(define (double f)
    (lambda (x) (f (f x)))
)

(define (inc x)
    (+ 1 x)
)
