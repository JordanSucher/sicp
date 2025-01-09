Exercise 1.12: Pascal’s triangle

The numbers at the edge of the triangle are all 1, and each
number inside the triangle is the sum of the two numbers
above it.35 Write a procedure that computes elements of
Pascal’s triangle by means of a recursive process.

        ;     1
        ;    1 1
        ;   1 2 1
        ;  1 3 3 1
        ; 1 4 6 4 1

        [0, 1, 0]
        [0, 1, 1, 0]
        [0, 1, 2, 1, 0]



pas(5) {
    if (n=0) {
        let arr = [0, 1, 0]
    }
    else {
        let arr = pas(n-1)
        let result = []
        let temp = 0
        for (i in arr) {
            temp = arr[i]+temp
            result.push(temp)
        }
        result.push(0)
    }
}


(define (displayPas n)
    (define (iter n index)
        (display (pas (+ 1 index)))
        (newline)
        (if (> n (+ 1 index))
            (iter n (+ 1 index))
        )
    )
    (newline)
    (iter n 0)
)

(define (pas n)
(if (= n 1)
    (list 0 1 0)
    (constructRow (pas (- n 1)) (list) 0)
    )
)


(define (constructRow prevRow currRow prevElement)
    (if (= (length currRow) (length prevRow))
        (append currRow (list 0))
        (constructRow 
            prevRow 
            (append currRow (list (+ prevElement (list-ref prevRow (length currRow))))) 
            (list-ref prevRow (length currRow))
        )
    )
)


(constructRow 
    (list 0 1 0)
    (list)
    0
)

(constructRow
    [0,1,0]
    [].append(0 + [0,1,0][0]) = [0]
    [0,1,0][1] = 1
)

(constructRow
    [0,1,0]
    [0].append([0,1,0][1]) = [0,1]
    [0,1,0][1] = 2
)

(constructRow
    [0,1,0]
    [0].append([0,1,0][2]) = [0,1,]
    [0,1,0][1] = 2
)

