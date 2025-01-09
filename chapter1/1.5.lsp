; in applicative order, arguments are evaluated before function is applied. in normal order, arguments are not evaluated until they are needed


(define (p) (p))

(define (test x y)
(if (= x 0) 0 y))

(test 0 (p))

; in applicative order, this would result in an error because p is an infinite loop

; in normal order, this would return 0
