the good enough test for computing square roots is: make a guess, then average your guess with the number divided by your guess, and repeat until the difference 


let sqrt-iter = (guess, x) => {
    let goodEnough = Math.abs(guess^2-x) < .001

    if (goodEnough) {
        return guess
    }
    else {
        let improvedGuess = (guess + x/guess)/2
        return sqrt-iter(improvedGuess, x)
    }
}

for a small number like .0001

goodEnough = 1^2 - .0001 = .9999
improved guess = (1 + .0001)/2 = .500005
goodEnough = .500005^2 - .0001 = 0.24990500002
improved guess = (.500005 + .0001/.500005)/2 = 0.250102499
goodEnough = 0.250102499^2 - .0001 = 0.06245126
improved guess = (0.250102499 + .0001/0.250102499)/2 = 0.12525116753
goodEnough = 0.12525116753^2 - .0001 = 0.01558785496
improved guess = (0.12525116753 + .0001/0.12525116753)/2 = 0.06302478164
goodEnough = 0.06302478164^2 - .0001 = 0.0038721231
improved guess = (0.06302478164 + .0001/0.06302478164)/2 = 0.03230572954
goodEnough = 0.03230572954^2 - .0001 = 0.00094366016
END

so this just stops too early, before the algorithm converges on an accurate answer 

for a big number, the problem is that at a certain point guess and x/guess are nearly equal in floating point terms - so their average is equal to guess, leaving the program in an infinite loop.

alternate strategy is to watch how guess changes from one iteration to the next and to stop when the change is a small fraction of the guess

(define (square x) (* x x))

(define (good-enough? previous-guess guess)
    (> (abs (- guess previous-guess)) (* .000001 * previous-guess))
)


(define (sqrt-iter guess x)
    (if (good-enough guess (improve guess x))
        guess
        (sqrt-iter (improve guess x) x)
    )
)
 

(define (improve guess x)
    (average guess (/ x guess))
)
  

(define (average x y)
(/ (+ x y) 2))
 

(define (sqrt x)
    (sqrt-iter 1 x)
)

  