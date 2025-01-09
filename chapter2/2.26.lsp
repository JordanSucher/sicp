Exercise 2.26: Suppose we define x and y to be two lists:
(define x (list 1 2 3))
(define y (list 4 5 6))

What result is printed by the interpreter in response to eval-
uating each of the following expressions:

(append x y)

(1 2 3 4 5 6)

(cons x y)

((1 2 3) 4 5 6)

(list x y)

((1 2 3) (4 5 6))

in a "proper list", the 2nd item of every pair (except the last one, whose 2nd item is an empty list ()) is a pointer, so 

(cdr (list x y)) = ((4 5 6))

whereas

(cdr (cons x y)) = (4 5 6)
