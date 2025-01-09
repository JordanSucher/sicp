Exercise 3.35: Ben Bitdiddle tells Louis that one way to
avoid the trouble in Exercise 3.34 is to define a squarer
as a new primitive constraint. Fill in the missing portions
in Ben’s outline for a procedure to implement such a con-
straint:

(define (squarer a b)
    (define (process-new-value)
        (if (has-value? b)
            (if (< (get-value b) 0)
                (error "square less than 0: SQUARER" (get-value b))
                (set-value! a (sqrt b) me))
            (set-value! b (square (get-value a)) me))
    )
    (define (process-forget-value) 
        (forget-value! a me)
        (forget-value! b me)
        (process-new-value)        
    )
    (define (me request) 
        (cond 
            ((eq? request 'I-have-a-value) (process-new-value))
            ((eq? request 'I-lost-my-value) (process-forget-value))
            (else (error "Unknown request: MULTIPLIER" request))
        )
    )
    (connect a me)
    (connect b me)
    me
)

---

(define (multiplier m1 m2 product)
    (define (process-new-value)
        (cond 
            ((or    (and (has-value? m1) (= (get-value m1) 0))
                    (and (has-value? m2) (= (get-value m2) 0)))
            (set-value! product 0 me))
            ((and   (has-value? m1) (has-value? m2))
            (set-value! product (* (get-value m1) (get-value m2)) me))
            ((and (has-value? product) (has-value? m1))
            (set-value! m2 (/ (get-value product) (get-value m1)) me))
            ((and (has-value? product) (has-value? m2))
            (set-value! m1 (/ (get-value product) (get-value m2)) me)))
    )
    (define (process-forget-value)
        (forget-value! product me)
        (forget-value! m1 me)
        (forget-value! m2 me)
        (process-new-value)
    )
    (define (me request)
        (cond 
            ((eq? request 'I-have-a-value) (process-new-value))
            ((eq? request 'I-lost-my-value) (process-forget-value))
            (else (error "Unknown request: MULTIPLIER" request))
        )
    )
    (connect m1 me)
    (connect m2 me)
    (connect product me)
    me
)
