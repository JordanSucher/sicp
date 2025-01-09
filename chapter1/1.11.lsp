Exercise 1.11: A function f is defined by the rule that:

n if n < 3,
f (n−1) + 2f (n−2) + 3f (n−3) if n ≥3.

n=4
f(3) + 2*f(2) + 3*f(1)
f(3) + 7
f(2) + 2*f(1) + 3*f(0) + 7
4 + 7 = 11

n=5
f(4) + 2*f(3) + 3*f(2)
f(4) + 2*(f(2)+2*f(1)+3*f(0)) + 3*f(2)
f(3) + 2*f(2) + 3*f(1) + 2*(f(2)+2*f(1)+3*f(0)) + 3*f(2)
f(2) + 2f(1) + 3f(0) + 2f(2) + 3f(1) + 2f(2)+4f(1)+6f(0) + 3f(2)

2=prev
1=prev2
0=prev3

n=5

index 3
f(2) + 2f(1) + f(3)
2 + 2*1 + 3*0 = 4

index 4
f(3) + 2f(2) + 3f(1)
4 + 4 + 3 = 11

index 5
f(4) + 2f(3) + 3f(2)
11 + 8 + 6 = 25


Write a procedure that computes f by means of an iterative process. Write a procedure that computes f by means of a recursive process

(define (f n)
    (if (< n 3)
        n
        (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))
    )
)

when n=2

when n=3
f(2) + 2*f(1) + 3*f(0)
= 2 + 2 = 4

when n=4
f(3) + 2*f(2) + 3*f(1)

when n=5
f(4) + 2*f(3) + 3*f(2)

the goal is to avoid deferred computation, i think...
i think we can go backwards and work our way up and keep a running sum as we go

some pseudocode

total = 0
index = 0

while n > 3
    tempSum = prev+2*prev2 + (index+2) = 2 + 2*(index+1) + 3*index = 4
    total += tempSum    
    index ++
    n -- 

; ---

; n if n < 3,
; f (n−1) + 2f (n−2) + 3f (n−3) if n ≥3.

; ---

(define (f-iter prev prev2 prev3 n)
(if (> n 2)
    (f-iter 
        (+ prev (* 2 prev2) (* 3 prev3))
        prev
        prev2
        (- n 1)   
    )
    prev)
)

(define (ff n)
    (if (< n 3)
        n
        (f-iter 2 1 0 n)
    )
)
