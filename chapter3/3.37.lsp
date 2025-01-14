Exercise 3.37: e celsius-fahrenheit-converter pro-
cedure is cumbersome when compared with a more expression-
oriented style of definition, such as

(define (celsius-fahrenheit-converter x)
    (c+ 
        (c* 
            (c/ 
                (cv 9) 
                (cv 5)) 
            x)
        (cv 32))
)

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))

Here c+, c*, etc. are the “constraint” versions of the arith-
metic operations. For example, c+ takes two connectors as
arguments and returns a connector that is related to these
by an adder constraint:

(define (c+ x y)
    (let ((z (make-connector)))
    (adder x y z)
    z)
)

Define analogous procedures c-, c*, c/, and cv (constant
value) that enable us to define compound constraints as in
the converter example above.

(define (cv x)
   (let ((z (make-connector)))
    (constant x z)     
    z)
)

(define (c- x y)
   (let ((z (make-connector)))
    (adder z y x)     
    z)
)

(define (c* x y)
   (let ((z (make-connector)))
    (multiplier x y z)     
    z)
)

(define (c/ x y)
   (let ((z (make-connector)))
    (multiplier z y x)     
    z)
)
