Exercise 3.50: Complete the following definition, which
generalizes stream-map to allow procedures that take mul-
tiple arguments, analogous to map in Section 2.2.1, Footnote 12.

(define (stream-map proc . argstreams)
    (if (stream-null? (car argstreams))
        the-empty-stream
        (stream-cons
        (apply proc (map stream-car argstreams))
        (apply stream-map
        (cons proc (map stream-cdr argstreams))))
    )
)

---

(define (stream-map proc s)
    (if (stream-null? s)
        the-empty-stream
        (cons-stream (proc (stream-car s)) (stream-map proc (stream-cdr s)))
    )
)
