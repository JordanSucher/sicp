Exercise 2.43: Louis Reasoner is having a terrible time do-
ing Exercise 2.42. His queens procedure seems to work, but
it runs extremely slowly. (Louis never does manage to wait
long enough for it to solve even the 6×6 case.) When Louis
asks Eva Lu Ator for help, she points out that he has inter-
changed the order of the nested mappings in the flatmap,
writing it as

(flatmap
    (lambda (new-row)
        (map 
            (lambda (rest-of-queens)
                    (adjoin-position new-row k rest-of-queens))
            (queen-cols (- k 1)))
    )
    (enumerate-interval 1 board-size)
)


; outer map iterates over each row of the board
; inner map, for each way to place the kth queen, generates every way to place k-1 queens 


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

; outer map generates all ways to place k-1 queens
; inner map, for each way to place k-1 queens, generates every way to place the kth queen

;therefore, the latter calls queen-cols once per column, then iterates through rows. ~ O(n) time
;whereas the former calls queen-cols n times per column where n is the number of cols, so O(1) = 1, O(2) = 4, O(3) = 9
; thus, the process goes from O(n) to O(n^2) time




Explain why this interchange makes the program run slowly.
Estimate how long it will take Louis’s program to solve the
eight-queens puzzle, assuming that the program in Exercise
2.42 solves the puzzle in time T

