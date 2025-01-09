(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

;this function takes 2 args, a and b. if b is > 0, then evals a + b, otherwise evals a - b
