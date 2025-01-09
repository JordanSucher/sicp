Exercise 2.42: The “eight-queens puzzle” asks how to place eight queens on a chessboard 
so that no queen is in check from any other (i.e., no two queens are in the same row, column, 
or diagonal). One possible solution is shown in Figure 2.8. One way to solve the puzzle is to 
work across the board, placing a queen in each column. Once we have placed k−1 queens, we must 
place the kth queen in a position where it does not check any of the queens already on the board. 
We can formulate this approach recursively: Assume that we have already generated the sequence of 
all possible ways to place k−1 queens in the first k−1 columns of the board. For each of these ways, 
generate an extended set of positions by placing a queen in each row of the kth column. Now filter 
these, keeping only the positions for which the queen in the kth column is safe with respect to the 
other queens. This produces the sequence of all ways to place k queens in the first k columns. By 
continuing this process, we will produce not only one solution, but all solutions to the puzzle.

We implement this solution as a procedure queens, which returns a sequence of all solutions to the 
problem of placing n queens on an n-by-n chessboard. queens has an internal procedure queen-cols that 
returns the sequence of all ways to place queens in the first k columns of the board

(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens)
                        (map 
                            (lambda (new-row)
                            (adjoin-position
                            new-row k rest-of-queens))
                            (enumerate-interval 1 board-size)
                        )
                    )
                    (queen-cols (- k 1))
                )
            )
        )
    )
    (queen-cols board-size)
)

(queens 1)

(if (= 1 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? 1 positions))
                (flatmap
                    (lambda (rest-of-queens)
                        (map 
                            (lambda (new-row)
                            (adjoin-position
                            new-row 1 rest-of-queens))
                            (enumerate-interval 1 4)
                        )
                    )
                    '((1) (2) (3) (4))
                )
            )
)



In this procedure rest-of-queens is a way to place k−1 queens in the first k−1 columns, 
and new-row is a proposed row in which to place the queen for the kth column. Complete 
the program by implementing the representation for sets of board positions, including the 
procedure adjoin-position, which adjoins a new row-column position to a set of positions, 
and empty-board, which represents an empty set of positions. You must also write the procedure 
safe?, which determines for a set of positions, whether the queen in the kth column is safe 
with respect to the others. (Note that we need only check whether the new queen is safe —
the other queens are already guaranteed safe with respect to each other.)

---


lets represent a board as a 1-by-n vector, where each element represents a column and the 
value represents the row of the queen. 

(1 2 3 4 5 6 7) or ()

1 - adjoin-position

since the simplest null case is '(), lets put the new column first and append the others onto it, so
right-to-left

(map 
    (lambda (new-row)
    (adjoin-position
    new-row k rest-of-queens))
    (enumerate-interval 1 board-size)
)

(define (adjoin-position new-row k rest-of-queens)
    (append (list new-row) rest-of-queens)
)

2 - empty-board
the simplest null case that we can still map over is '(())

(define empty-board (list))

3 - safe?

we are progressively building out our queens list from right to left. each position is going to look
like a vector, so (1 4 2) or (1 6 4)

we are always going to be checking if the furthest left is "safe"

(define (safe? k position)
    (cond
        ((null? position) #t)
        ((= 1 (length position)) #t)
        (else (iter-safe? (cdr position) (+ (car position) 1) (- (car position) 1) (car position)))
    )    
)

(define (iter-safe? position upper lower row)
    (cond
        ((null? position) #t)
        ((= row (car position)) #f)
        ((= upper (car position)) #f)
        ((= lower (car position)) #f)
        ((= 0 (length position)) #t)
        (else (diag-safe? (cdr position) (+ upper 1) (- lower 1) row))
    )        
)

(iter-safe? 3)
