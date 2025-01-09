Exercise 2.38: The accumulate procedure is also known as
fold-right, because it combines the first element of the se-
quence with the result of combining all the elements to the
right. Here is also a fold-left, which is similar to fold-
right, except that it combines elements working in the op-
posite direction:


(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
        result
        (iter   (op result (car rest))
                (cdr rest)))
    )
    (iter initial sequence)
)

(fold-right / 1 (list 1 2 3))

1 / (2 / 3)
3/2

(fold-left / 1 (list 1 2 3))


1/1 = 1
(iter 1 (2 3))
1/2 = .5
(iter .5 (3))
1/2 / 3
1/6


(fold-right list '() (list 1 2 3))

list 1 (list 2 (list 3 '()))
(1 (2 (3 ())))


(fold-left list '() (list 1 2 3))

(iter (list '() 1) (2 3))
    (iter ('() 1) (2 3))
(iter (list ('() 1) 2) (3))
    (iter (('() 1) 2) (3))
(iter (list (('() 1) 2) 3) '())
    (iter ((('() 1) 2) 3) '())
((('() 1) 2) 3)



Give a property that op should satisfy to guarantee that
fold-right and fold-left will produce the same values
for any sequence.

Given x, y (op x y) must = (op y x)
