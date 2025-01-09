Exercise 2.33: Fill in the missing expressions to complete
the following definitions of some basic list-manipulation
operations as accumulations:


(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence))
        )
    )
)

(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) '() sequence)
)

; (map square (1 2))
;     (accumulate (lambda (x y) (append (square x) y)) '() (1 2))
;         (lambda (x y) (append (square x) y))
;         (append (square 1) (accumulate (lambda (x y) (append (square x) y)) '() (2)))
;             (append (square 2) (accumulate (lambda (x y) (append (square x) y)) '() ())) ; = '()
;         (append 1 '()) ; error


(define (append seq1 seq2)
    (accumulate cons seq2 seq1)
)

(define (length sequence)
    (accumulate (lambda (x y) (+ 1 y)) 0 sequence)
)
