Exercise 2.73: Section 2.3.2 described a program that per-
forms symbolic diﬀerentiation:

(define (deriv exp var)
    (cond 
        ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum   (deriv (addend exp) var)
                                (deriv (augend exp) var)))
        ((product? exp) (make-sum   (make-product   (multiplier exp)
                                                    (deriv (multiplicand exp) var))
                                    (make-product   (deriv (multiplier exp) var)
                                                    (multiplicand exp))))
        ⟨more rules can be added here⟩
        (else (error "unknown expression type: DERIV" exp))
    )
)

We can regard this program as performing a dispatch on the type of the expression to be diﬀerentiated. 
In this situation the “type tag” of the datum is the algebraic operator symbol (such as +) and the 
operation being performed is deriv. We can transform this program into data-directed
style by rewriting the basic derivative procedure as

(define (deriv exp var)
    (cond   
        ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp) var))
    )
)

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

a. Explain what was done above. Why can’t we assimilate the predicates number? and variable? into the
data-directed dispatch?

Now the method is calling a generic method that gets a specific method from a lookup table.
We can't assimilate the number and variable cases into the dispatch because they don't have operands. 

b. Write the procedures for derivatives of sums and products, and the auxiliary code required 
to install them in the table used by the program above.

(define (install-package)
    ;; internal procedures
    (define (deriv-sum exp var)
        (make-sum   (deriv (addend exp) var)
                    (deriv (augend exp) var))
    )
    (define (deriv-product exp var)
        (make-sum   (make-product   (multiplier exp)
                                    (deriv (multiplicand exp) var))
                    (make-product   (deriv (multiplier exp) var)
                                    (multiplicand exp)))           
    )
    
    ;; interface to the rest of the system
    (put 'deriv '(sum) deriv-sum)
    (put 'deriv '(product) deriv-product)
)

c. Choose any additional diﬀerentiation rule that you like, such as the one for exponents (Exercise 2.56), and
install it in this data-directed system.





(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
    ;eg rational rational
        (let ((proc (get op type-tags)))
        ;eg sum[rational, rational]
            (if proc
                (apply proc (map contents args))
                ;eg sum(1 2)
                (error "No method for these types: APPLY-GENERIC"
                (list op type-tags))
            )
        )
    )
)
