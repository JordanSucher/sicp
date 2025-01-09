Exercise 2.11: In passing, Ben also cryptically comments:
“By testing the signs of the endpoints of the intervals, it is
possible to break mul-interval into nine cases, only one
of which requires more than two multiplications.” Rewrite
this procedure using Bens suggestion.


(define (mul-interval x y)
    (let (  (p1 (* (lower-bound x) (lower-bound y)))
            (p2 (* (lower-bound x) (upper-bound y)))
            (p3 (* (upper-bound x) (lower-bound y)))
            (p4 (* (upper-bound x) (upper-bound y)))
        )
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4)))
)

(+ +) (+ +)
min = x1*y1
max = x2*y2

(+ +) (- +)
min = x1*y1
max = x2*y2

(+ +) (- -)
min = x2*y1
max = x1*y2

(- +) (+ +)
min = x1*y2
max = x2*y2

(- +) (- +)
min could be x1*y2 or x2*y1
max could be x1*y1 or x2*y2

(- +) (- -)
min = x2*y1
max = x1*y1

(- -) (+ +)
min = x1*y2
max = x2*y1

(- -) (- +)
min = x2*y2
max = x1*y1

(- -) (- -)
min = x2*y2
max = x1*y1
