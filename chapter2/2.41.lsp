Exercise 2.41: Write a procedure to find all ordered triples
of distinct positive integers i, j, and k less than or equal to
a given integer n that sum to a given integer s.



(define (sum-triplets n s)
    (filter (lambda (x) (= s (accumulate + 0 x))) 
            (unique-triplets n)
    )            
)

(define (unique-triplets n)
    (flatmap 
        (lambda (i) 
            (flatmap 
                (lambda(j)
                    (map
                        (lambda (k) (list i j k))
                        (enumerate-interval 1 (- j 1))   
                    )
                ) 
                (enumerate-interval 1 (- i 1))
            )
        )
        (enumerate-interval 1 n)
    )        
)

---

(define (unique-pairs n)
    (flatmap 
        (lambda (i) (
            map (lambda(j) (list i j)) 
            (enumerate-interval 1 (- i 1))
        ))
        (enumerate-interval 1 n)
    )        
)
