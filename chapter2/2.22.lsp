Exercise 2.22: Louis Reasoner tries to rewrite the first square-
list procedure of Exercise 2.21 so that it evolves an itera-
tive process:

(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter 
                (cdr things)
                (cons (square (car things)) answer)
            )
        )
    )
    (iter items nil)
)


Unfortunately, defining square-list this way produces the
answer list in the reverse order of the one desired. Why?

; Because at each iteration, you take the current first item, square it, put it at the front of result, 
; then repeat with the tail of the list. The function is making a stack from front to back.

Louis then tries to fix his bug by interchanging the argu-
ments to cons:

(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter 
                (cdr things)
                (cons answer (square (car things)))
            )
        )
    )
    (iter items nil)
)

This doesnt work either. Explain.

; This causes the nested structure like ((1 2) 3). If you want to make a single-level list with cons,
; you must pass the number first. Maybe bc lists are syntactic sugar for linked pairs
