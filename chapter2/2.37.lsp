Exercise 2.37: Suppose we represent vectors v = (vi) as
sequences of numbers, and matrices m = (mij) as sequences
of vectors (the rows of the matrix). For example, the matrix

1 2 3 4
4 5 6 6
6 7 8 9

is represented as the sequence ((1 2 3 4) (4 5 6 6)
(6 7 8 9))

With this representation, we can use sequence
operations to concisely express the basic matrix and vector
operations. These operations (which are described in any
book on matrix algebra) are the following:

(dot-product v w) returns the sum Σi vi wi ;

(matrix-*-vector m v) returns the vector t,
where ti = Σj mij vj ;

(matrix-*-matrix m n) returns the matrix p,
where pij = Σk mik nkj ;

(transpose m) returns the matrix n,
where nij = mji.

We can define the dot product as

(define (dot-product v w)
    (accumulate + 0 (map * v w))
)

Fill in the missing expressions in the following procedures
for computing the other matrix operations. (The procedure
accumulate-n is defined in Exercise 2.36.)

(define (matrix-*-vector m v)
    (map (lambda (x) (dot-product x v)) m)
)

(define (transpose mat)
    (accumulate-n cons '() mat)
)

(define (matrix-*-matrix m n)
    (let 
        ((cols (transpose n)))
        (map (lambda (row) (map (lambda (col) (dot-product row col)) cols)) m)
    )
)
