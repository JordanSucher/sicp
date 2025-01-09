Exercise 3.54: Define a procedure mul-streams, analogous
to add-streams, that produces the elementwise product of
its two input streams. Use this together with the stream of
integers to complete the following definition of the stream
whose nth element (counting from 0) is n + 1 factorial:

(define factorials
    (cons-stream 1 (mul-streams factorials (integers-starting-from 2)))
)

n       0 1 2 3  4   5
(n+1)!  1 2 6 24 120 720

---

(define (mul-streams s1 s2) (stream-map * s1 s2))

(define (add-streams s1 s2) (stream-map + s1 s2))

