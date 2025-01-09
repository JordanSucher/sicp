Exercise 3.63: Louis Reasoner asks why the sqrt-stream
procedure was not written in the following more straight-
forward way, without the local variable guesses:

(define (sqrt-stream x)
    (define guesses
        (cons-stream
            1.0
            (stream-map (lambda (guess) (sqrt-improve guess x))
            guesses)
        )
    )
    guesses
)


(define (sqrt-stream x)
    (cons-stream 
        1.0 
        (stream-map (lambda (guess) (sqrt-improve guess x)) 
        (sqrt-stream x))
    )
)


using the local variable invokes memoization
