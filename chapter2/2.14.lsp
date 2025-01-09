Exercise 2.14: Demonstrate that Lem is right. Investigate the behavior of the system on a variety of 
arithmetic expressions. Make some intervals A and B, and use them in computing the expressions A/A and A/B. 
You will get the most insight by using intervals whose width is a small percentage of the center value. 
Examine the results of the computation in center-percent form (see Exercise 2.12).



(define (div-interval x y)
    (define (div)
        (mul-interval
            x
            (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))
        )
    )
    (if (<= (lower-bound y) 0 (upper-bound y))
        "error"
        (div)
    )
)



; R1R2 / (R1 + R2)

(define (par1 r1 r2)
    (div-interval 
        (mul-interval r1 r2)
        (add-interval r1 r2)
    )
)

; 1 / ((1/R1) + (1/R2))

(define (par2 r1 r2)
    (let ((one (make-interval 1 1)))
        (div-interval
            one (add-interval 
                    (div-interval one r1)
                    (div-interval one r2))
        )
    )
)

r1 = (c1-c1p1, c1+c1p1)
r2 = (c2-c2p2, c2+c2p2)

(par1 r1 r2)

(div-interval (mul-interval r1 r2) (add-interval r1 r2))
    (mul-interval r1 r2)
        (c1-c1p1)(c2-c2p2), (c1+c1p1)(c2+c2p2)
        R1R2 = (c1c2(1-p1)(1-p2)), (c1c2(1+p1)(1+p2))
    (add-interval r1 r2)
        R1+R2 = (c1(1-p1)+c2(1-p2)), (c1(1+p1)+c2(1+p2))
(mul-interval
    (c1c2(1-p1)(1-p2)), (c1c2(1+p1)(1+p2))
    1/(c1(1+p1)+c2(1+p2)), 1/(c1(1-p1)+c2(1-p2))
)

par1 =
    ((c1c2(1-p1)(1-p2)) / (c1(1+p1)+c2(1+p2))), 
    ((c1c2(1+p1)(1+p2)) / (c1(1-p1)+c2(1-p2)))


(par2 r1 r2)

(div-interval
    one 
    (add-interval 
        (div-interval one r1)
        (div-interval one r2)
    )
)

(div-interval one r1)
    (1/(c1+c1p1), 1/(c1-c1p1))
    (1/c1(1+p1), 1/c1(1-p1))

(div-interval one r2)
    (1/(c2+c2p2), 1/(c2-c2p2))
    (1/c2(1+p2), 1/c2(1-p2))

(add-interval 
    (1/c1(1+p1), 1/c1(1-p1))
    (1/c2(1+p2), 1/c2(1-p2))
)
    1/c1(1+p1) + 1/c2(1+p2)
        (c1(1+p1)+c2(1+p2))/(c1c2(1+p1)(1+p2))
    1/c1(1-p1) + 1/c2(1-p2)
        (c1(1-p1)+c2(1-p2))/(c1c2(1-p1)(1-p2))

    z = 
        (c1(1+p1)+c2(1+p2))/(c1c2(1+p1)(1+p2)) , 
        (c1(1-p1)+c2(1-p2))/(c1c2(1-p1)(1-p2))

(div-interval
    one
    z
)

    1/((c1(1-p1)+c2(1-p2))/(c1c2(1-p1)(1-p2))) , 
    1/((c1(1+p1)+c2(1+p2))/(c1c2(1+p1)(1+p2)))
    
    par2 = 
        (c1c2(1-p1)(1-p2)) / (c1(1-p1)+c2(1-p2)) , 
        (c1c2(1+p1)(1+p2)) / (c1(1+p1)+c2(1+p2))





