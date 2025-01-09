Exercise 3.53: Without running the program, describe the
elements of the stream defined by

(define s (cons-stream 1 (add-streams s s)))

this will end up being (1 2 4 8) - powers of 2
