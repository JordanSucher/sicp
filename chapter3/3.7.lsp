Exercise 3.7: Consider the bank account objects created by
make-account, with the password modification described
in Exercise 3.3. Suppose that our banking system requires
the ability to make joint accounts. Define a procedure make-
joint that accomplishes this. make-joint should take three
arguments. The first is a password-protected account. The
second argument must match the password with which the
account was defined in order for the make-joint operation
to proceed. The third argument is a new password. make-
joint is to create an additional access to the original ac-
count using the new password. For example, if peter-acc
is a bank account with password open-sesame, then

(define paul-acc
(make-joint peter-acc 'open-sesame 'rosebud))

will allow one to make transactions on peter-acc using the
name paul-acc and the password rosebud. You may wish
to modify your solution to Exercise 3.3 to accommodate this
new feature.


(define (make-joint acc1 pw1 pw2)
    (define (wrapped-acct pw m)
        (cond
            ((not (eq? pw pw2)) (error "Incorrect password"))
            (else (acc1 pw1 m))
        )            
    )

    (if (acc1 pw1 'check-password)
        wrapped-acct
        (lambda (x) (error "Incorrect password"))
    )        
)

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
            ((eq? m 'check-password) #t)
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request: MAKE-ACCOUNT" m))
        )
    )
    dispatch
)
