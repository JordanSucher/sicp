Exercise 2.32: We can represent a set as a list of distinct
elements, and we can represent the set of all subsets of the
set as a list of lists. For example, if the set is (1 2 3), then
the set of all subsets is (() (3) (2) (2 3) (1) (1 3)
(1 2) (1 2 3)). 

Complete the following definition of a
procedure that generates the set of subsets of a set and give
a clear explanation of why it works:

(define (subsets s)
    (if (null? s)
        (list '())
        (let 
            ((rest (subsets (cdr s)))) 
            (append rest (map (lambda (x) (append (list(car s)) x)) rest))       
        )
    )
)

---

(subsets (1 2))
    (null? (1 2)) ;f
    (define rest (subsets (2)))
        (subsets (2))
            (define rest (subsets ()))
                (null? ()) ;t
                = ()
            (append (()) (map (lambda (x) (append (list 2) (list x))) (()))) 
                (map (lambda (x) (append (list 2) x)) (list '()))

---

(define rest (subsets (2)))
    (define rest (subsets ())) ; = ()
    (append () (map (append (list(car s)) x) rest))
    (2)

(append (2) (map (append (1) x) rest))
((1 2) (1))

(map (lambda (x) 
        (if (null? x)
            (list 1)    
            (append (list 1) (list x))
        )
    ) 
    (list 2)
)

((1 2))

(append (list 1) (list 2)) ; (1 2)
(append (list 1) ()) ; (1)

(map (lambda (x) (display x)(newline)) (list 2))

(map (lambda (x) (append (list 2) x)) (list))


---

(define (subsets s)
    ; for each item, get
        ; it on its own
        ; it with each subsequent item, individually
        ; it with each combination of subsequent items
        
)
