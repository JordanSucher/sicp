Exercise 2.2: Consider the problem of representing line
segments in a plane. Each segment is represented as a pair
of points: a starting point and an ending point. Define a
constructor make-segment and selectors start-segment and
end-segment that define the representation of segments in
terms of points. Furthermore, a point can be represented
as a pair of numbers: the x coordinate and the y coordi-
nate. Accordingly, specify a constructor make-point and
selectors x-point and y-point that define this representa-
tion. Finally, using your selectors and constructors, define a
procedure midpoint-segment that takes a line segment as
argument and returns its midpoint (the point whose coor-
dinates are the average of the coordinates of the endpoints).
To try your procedures, you’ll need a way to print points:




(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
)

(define (make-segment a b)
    (cons a b)
)

(define (start-segment s)
    (car s)
)

(define (end-segment s)
    (cdr s)
)

(define (make-point x y)
    (cons x y)
)

(define (x-point p)
    (car p)
)

(define (y-point p)
    (cdr p)
)

(define (midpoint s)
    (let (
        (x1 (x-point (start-segment s)))
        (x2 (x-point (end-segment s)))
        (y1 (y-point (start-segment s)))
        (y2 (y-point (end-segment s)))
    )
    
    (make-point 
        (/ (+ x1 x2) 2)
        (/ (+ y1 y2) 2)
    )
    
    )
)

(define a (make-point 0 0))
(define c (make-point 5 5))
(define s2 (make-segment a c))
(midpoint s2)
