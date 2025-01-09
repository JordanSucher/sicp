Exercise 3.52: Consider the sequence of expressions

(define sum 0)
(define (accum x) (set! sum (+ x sum)) sum)
(define seq
(stream-map accum
(stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z
(stream-filter (lambda (x) (= (remainder x 5) 0))
seq))
(stream-ref y 7)
(display-stream z)

What is the value of sum afer each of the above expressions
is evaluated? What is the printed response to evaluating
the stream-ref and display-stream expressions? Would
these responses diﬀer if we had implemented (delay ⟨exp⟩)
simply as (lambda () ⟨exp⟩) without using the optimiza-
tion provided by memo-proc? Explain.


(define sum 0)
;sum = 0

(define (accum x) (set! sum (+ x sum)) sum)
;sum = 0 

(define seq
    (stream-map accum
        (stream-enumerate-interval 1 20)
    )
)
;seq = 1, sum = 1


(define y (stream-filter even? seq))
;seq = 3, sum = 3
;seq = 6, sum = 6, y = 6

(define z
    (stream-filter (lambda (x) (= (remainder x 5) 0))
    seq)
)
;seq = 10, sum = 10


(stream-ref y 7)
;y0, seq = 6, sum = 10
;y1, seq = 10, sum = 10
;seq = 15, sum = 15
;seq = 21, sum = 21
;y2, seq = 28, sum = 28
;y3, seq = 36, sum = 36
;seq = 45, sum = 45
;seq = 55, sum = 55
;y4, seq = 66, sum = 66
;y5, seq = 78, sum = 78
;seq = 91, sum = 91
;seq = 105, sum 105
;y6, seq = 120, sum = 120
;y7, seq = 136, sum = 136

(display-stream z)

10 ;sum = 136
15 ;sum = 136
45 ;sum = 136
55 ;sum = 136
105 ;sum = 136
120 ;sum = 136
190 ;sum = 136 + 17 + 18 + 19 = 190
210 ;sum = 210
