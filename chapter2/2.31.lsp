Exercise 2.31: Abstract your answer to Exercise 2.30 to
produce a procedure tree-map with the property that square-
tree could be defined as


(define (square-tree tree) (tree-map square tree))

(define (tree-map proc tree)
    (define (iter tree)
        (if (pair? tree)
            (tree-map proc tree)
            (proc tree)
        )
    )

    (map iter tree)
)
