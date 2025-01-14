Exercise 3.51: In order to take a closer look at delayed evaluation,
we will use the following procedure, which simply returns its argument afer printing it:

(define (show x)
    (display-line x)
x)

What does the interpreter print in response to evaluating
each expression in the following sequence?

(define x
    (stream-map show (stream-enumerate-interval 0 10))
)

0

(stream-ref x 5)

1
2
3
4
5
5

(stream-ref x 7)

6
7
7

