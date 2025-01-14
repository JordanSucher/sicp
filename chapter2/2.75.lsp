Exercise 2.75: Implement the constructor make-from-mag-
ang in message-passing style. This procedure should be anal-
ogous to the make-from-real-imag procedure given above.


(define (make-from-real-imag x y)
    (define (dispatch op)
        (cond 
            ((eq? op 'real-part) x)
            ((eq? op 'imag-part) y)
            ((eq? op 'magnitude) (sqrt (+ (square x) (square y))))
            ((eq? op 'angle) (atan y x))
            (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op))
        )
    )
    dispatch
)

(define (make-from-mag-ang m a)
    (define (dispatch op)
        (cond 
            ((eq? op 'real-part) (* r (cos a)))
            ((eq? op 'imag-part) (* r (sin a)))
            ((eq? op 'magnitude) m)
            ((eq? op 'angle) a)
            (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op))
        )
    )
    dispatch
)
