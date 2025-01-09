Exercise 2.30: Define a procedure square-tree analogous
to the square-list procedure of Exercise 2.21. That is, square-
tree should behave as follows:

(1 (2 (3 4) 5) (6 7))

(square-tree
    (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))


(1 (4 (9 16) 25) (36 49))

Define square-tree both directly (i.e., without using any
higher-order procedures) and also by using map and recur-
sion.

(define (square-tree tr)
    (cons 
        (if (pair? (car tr))
            (square-tree (car tr))
            (square (car tr))
        )
        (if (null? (cdr tr))
            '()
            (if (pair? (cdr tr))
                (square-tree (cdr tr))
                (list (square (cdr tr)))
            )
        )
    )       
)

; more succintly

(define (square-tree tree)
    (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else
            (cons
                (square-tree (car tree))
                (square-tree (cdr tree)))
        )
    )
)

; using recurison

(define (square-tree t)
  (map (lambda (t)
         (if (pair? t)
             (square-tree t)
             (square t)))
       t))

---

(define (square-tree-r tr)
    (if (pair? (car tr))
            (cons 
                (map square-tree-r (car tr))
                ()
            )
            
            )        
        
)

(define (square-list items)
    (map square items)
)

(square-tree (1 2))
(pair? (1 2)) ;t
(null? (2)) ;f
(append 
    (if (pair? (1)) ;f
        (list (square-tree (1)))
        (list (square (1)))
    ) = (1)
    
    (if (pair? (2)) ;t 
        (list (square-tree (2)))
        (list (square (2)))
    )
        (square-tree (2))
        (pair? (2)) ;t
        (null? ()) ;t
        (square-tree 2)
        (pair? 2) ;f
        (number? 2) ;t
        (list (square 2))
        (4)
) = (1 4)


---

(square-tree ((1 2) (3 4)))

(pair? ((1 2) (3 4))) ;t
(null? (3 4)) ;f
((pair? (1 2)) (append (square-tree (1 2)) (square-tree (3 4))))


---

(square-tree ((1 2) (3 4) 5))

(pair? ((1 2) (3 4) 5)) ;t
(null? (cdr ((1 2) (3 4) 5))) ;f
(list (square-tree (1 2)) (square-tree ((3 4) 5)))

    (square-tree (1 2))
        (pair? (1 2)) ;t
        (null? (cdr (1 2))) ;f
        (list (square-tree 1) (square-tree (2)))

            (square-tree 1)
            1

            (square-tree (2))
            (pair? (2)) ;t
            (null? (cdr (2))) ;t
            (square-tree 2)
            4

        (list 1 4)
        (1 4)

    (square-tree ((3 4) 5))
        (pair? ((3 4) 5)) ;t
        (null 5) ;f
        (list (square-tree (3 4)) (square-tree 5))

            (square-tree (3 4))
            (9 16)
            
            (square-tree 5)
            25
            
        (list (9 16) 25)
        ((9 16) 25)


    (list (1 4) ((9 16) 25))
    ((1 4) ((9 16) 25))












(square-tree (list 1 2))
;(1, 2)
(pair? (1,2)) ;true
(null? 2) ;false

(list (square-tree 1) (square-tree (2)))

    (square-tree 1)
    (pair? 1) ;f
    (number? 1) ;t
    (square 1) ; 1

(list 1 (square-tree (2)))

    (square-tree (2))
    (pair? (2)) ;t
    (null? ()) ;t
    (list (square-tree 2))

        (square-tree 2)
        (pair? 2) ;f
        (number? 2) ;t
        (square 2) ; 4

    (4)


(list 1 (4))





