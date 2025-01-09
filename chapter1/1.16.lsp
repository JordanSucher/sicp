Exercise 1.16: Design a procedure that evolves an itera-
tive exponentiation process that uses successive squaring
and uses a logarithmic number of steps, as does fast-expt.
(Hint: Using the observation that (b^n/2)^2 = (b^2)^n/2, keep,
along with the exponent n and the base b, an additional
state variable a, and define the state transformation in such
a way that the product abn is unchanged from state to state.
At the beginning of the process a is taken to be 1, and the
answer is given by the value of a at the end of the process.
In general, the technique of defining an invariant quantity
that remains unchanged from state to state is a powerful
way to think about the design of iterative algorithms.)

iterative exponentiation, meaning state passed to each call

wouldnt simplest version of this be like, each call gets the current value as well as the base, exponent, and current position?

this would not have a logarithmic number of steps, it would grow linearly

how do i use this hint to achieve logarithmic time?

obviously, i should iteratively transform into a simpler exponent

exp (b n a) {
   if (n is odd) {
        exp(b n-1 a*b)
   }
   if (n == 0) {
        a
   }
   {
      exp (b*b, n/2)
   }
}

(define (exp-fast b n a)
    (cond 
        ((= n 0) a)
        ((odd? n) (exp-fast b (- n 1) (* a b)))
        (else (exp-fast (* b b) (/ n 2) a))
    )
)

(define (odd? n)
(= (remainder n 2) 1))

2^8 = 2*2*2*2

2 8 1 
4 4 1 
16 2 1 
256 1 1 

