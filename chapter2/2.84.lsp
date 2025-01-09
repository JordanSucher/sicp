Exercise 2.84: Using the raise operation of Exercise 2.83,
modify the apply-generic procedure so that it coerces its
arguments to have the same type by the method of succes-
sive raising, as discussed in this section. You will need to
devise a way to test which of two types is higher in the
tower. Do this in a manner that is “compatible” with the
rest of the system and will not lead to problems in adding
new levels to the tower.

; we will need to
; - given a list of types, find the highest in the list
; - raise each in the list until we can't

(define (raise n)
  (apply-generic 'raise n)
)

; framework for tracking levels
(define numeric-tower '(integer rational real complex))

;first, given a list of types find the highest in the list
(define (parent sources)
    (define (iter result remaining)
        (if (null? remaining)
            result
            (let
                (
                    (curr (length (memq result numeric-tower)))
                    (next (length (memq (car remaining) numeric-tower)))
                )
                (if (curr < next)
                    (iter result (cdr remaining))
                    (iter (car remaining) (cdr remaining))
                )
            ) 
        )      
    )
    (iter 'integer sources) 
)

;then, given a list of args, raise them until error
(define (raise-to sources target)
    (define (iter result remaining)
        (if (null? remaining)
            result
            (let ((current (car remaining)))
                (if (eq? target (type-tag current))
                    (iter (append (list current) result) (cdr remaining))
                    (let ((raised (raise current)))
                        (if raised  ; if raise succeeds
                            (iter result (append (list raised) (cdr remaining)))
                            #f)))
            )
        )
    )       
    (iter '() sources))


; then, amend apply-generic to use iterative raising

(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (let ((raised (raise-to args (parent type-tags))))
                    (if raised
                        (apply-generic op raised)
                        (error "No method for these types and cannot raise"
                            (list op type-tags))
                    )
                )
            )
        )
    )
)
