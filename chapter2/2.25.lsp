Exercise 2.25: Give combinations of cars and cdrs that
will pick 7 from each of the following lists:

(define l1 (list 1 3 (list 5 7) 9))

(1 3 (5 7) 9)

(cdr (car (cdr (cdr l1))))


(define l2 (list (list 7)))

((7))

(car (car l2))


(define l3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(1 (2 (3 (4 (5 (6 7))))))

(cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr l3)))))))))))

