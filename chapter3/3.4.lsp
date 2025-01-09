Exercise 3.4: Modify the make-account procedure of Ex-
ercise 3.3 by adding another local state variable so that, if
an account is accessed more than seven consecutive times
with an incorrect password, it invokes the procedure call-
the-cops.


(define (make-account balance password)
    (define wrong-counter 0)
    (define (withdraw amount)
        (if (>= balance amount)
        (begin (set! balance (- balance amount))
        balance)
        "Insufficient funds")
    )
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance
    )
    (define (call-the-cops)
        (display "calling the cops")
    )
    (define (dispatch pw m)
        (cond 
            ((> wrong-counter 7) (call-the-cops))
            ((not (eq? pw password)) (set! wrong-counter (+ 1 wrong-counter)) (error "Incorrect password"))
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request: MAKE-ACCOUNT" m))
        )
    )
    dispatch
)



---
;from 3.3

(define (make-account balance password)
    (define (withdraw amount)
        (if (>= balance amount)
        (begin (set! balance (- balance amount))
        balance)
        "Insufficient funds")
    )
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance
    )
    (define (dispatch pw m)
        (cond 
            ((not (eq? pw password)) (error "Incorrect password"))
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request: MAKE-ACCOUNT" m))
        )
    )
    dispatch
)
