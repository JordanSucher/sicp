Exercise 2.82: Show how to generalize apply-generic to
handle coercion in the general case of multiple arguments.
One strategy is to attempt to coerce all the arguments to
the type of the first argument, then to the type of the sec-
ond argument, and so on.

;strategy - get a list of all the valid coercions, then try them one at a time until there are no more to try

;first, get all possible coercions

(define (is-coercion-possible dest sources)
    (cond
        ((null? sources) #t)
        ((= dest (car sources)) (is-coercion-possible dest (cdr sources)))
        ((get-coercion (car sources) dest) (is-coercion-possible dest (cdr sources)))
        (else #f)
    )        
)


(define (get-coercion-options types)
    (define (iter i result)
        (if (> i (length types))
            result
            (if (is-coercion-possible (list-ref types (- i 1)) types)
                (iter (+ 1 i) (append (list (list-ref types (- i 1))) result))
                (iter (+ 1 i) result)        
            )
        ) 
    )
        
    (iter 1 '())
)

;second, create a method to coerce a bunch of values to a target type

(define (coerce-all dest source-types source-data)
    (define (iter remaining-types remaining-data result)
        (if (null? remaining-types)
            result
            (if (= dest (car remaining-types))
                (iter (cdr remaining-types) (cdr remaining-data) (append (list (car remaining-data)) result))
                (iter (cdr remaining-types) (cdr remaining-data) (append (list ((get-coercion (car remaining-types) dest) (car remaining-data))) result))
            )        
        )
        (iter source-types source-data '())
    )        
)

; third, amend apply-generic to run through the types

(define (apply-generic op . args)
    (define coercion-options (get-coercion-options (map type-tag args)))
    
    (define (inner op types-to-try . args)
        (let (
                (type-tags (map type-tag args))
                (contents (map contents args))
            )
            (let ((proc (get op type-tags)))
                (if proc
                    (apply proc contents)
                    (cond 
                        ((not (null? types-to-try)) (inner op (cdr types-to-try) (coerce-all (car types-to-try) type-tags contents)))
                        (else   (error "No method for these types"
                                (list op type-tags)))
                    )
                )
            )
        )       
    )
        
    (inner op coercion-options args)
)

;original

(define (apply-generic-orig op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (if (= (length args) 2)
                    (let 
                        (
                            (type1 (car type-tags))
                            (type2 (cadr type-tags))
                            (a1 (car args))
                            (a2 (cadr args))
                        )
                        (let 
                            (
                                (t1->t2 (get-coercion type1 type2))
                                (t2->t1 (get-coercion type2 type1))
                            )
                            (cond 
                                (t1->t2 (apply-generic op (t1->t2 a1) a2))
                                (t2->t1 (apply-generic op a1 (t2->t1 a2)))
                                (else   (error "No method for these types"
                                        (list op type-tags)))
                            )
                        )
                    )
                    (error "No method for these types"
                    (list op type-tags))
                )
            )
        )
    )
)
