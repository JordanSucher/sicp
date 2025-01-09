Exercise 1.37:

a. An infinite continued fraction is an expression of the form

f = n1 / (d1 + n2 / (d2 + n3 / d3...))

As an example, one can show that the infinite con-
tinued fraction expansion with the Ni and the Di all
equal to 1 produces 1/ϕ, where ϕ is the golden ratio
(described in Section 1.2.2). One way to approximate
an infinite continued fraction is to truncate the expan-
sion afer a given number of terms. Such a truncation—
a so-called k-term finite continued fraction—has the form

f = n1 / (d1 + n2 / (d2 + n3 / d3... + nk / dk))

Suppose that n and d are procedures of one argument
(the term index i) that return the Ni and Di of the
terms of the continued fraction. Define a procedure
cont-frac such that evaluating (cont-frac n d k)
computes the value of the k-term finite continued frac-
tion. Check your procedure by approximating 1/ϕ using

(cont-frac 
    (lambda (i) 1.0)
    (lambda (i) 1.0)
    15
)

for successive values of k. How large must you make
k in order to get an approximation that is accurate to
4 decimal places?


(define (cont-frac n d k)
    (define (iter i result)
        (if (< i 1)
            result
            (iter (- i 1) (/ (n i) (+ (d i) result)))
        )
    )
    (* 1.0 (iter k 0))
)

b. If your cont-frac procedure generates a recursive pro-
cess, write one that generates an iterative process. If
it generates an iterative process, write one that gen-
erates a recursive process.

(define (cont-frac n d k)
    (define (iter i)
        (if (= i k)
            (/ (n i) (d i))
            (/ (n i) (+ (d i) (iter (+ 1 i))))
        )
    )
    (* 1.0 (iter 1))
)
