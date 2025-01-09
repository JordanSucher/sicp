Exercise 1.9: Each of the following two procedures defines
a method for adding two positive integers in terms of the
procedures inc, which increments its argument by 1, and
dec, which decrements its argument by 1.

(define (+ a b)
(if (= a 0) b (inc (+ (dec a) b))))

(define (+ a b)
(if (= a 0) b (+ (dec a) (inc b))))

Using the substitution model, illustrate the process gener-
ated by each procedure in evaluating (+ 4 5). Are these
processes iterative or recursive?

; first implementation

(+ 4 5)
(if (= 4 0) 5 (inc (+ (3) 5)))
(inc (if (= 3 0) 5 (inc (+ (2) 5))))
(inc (inc (if (= 2 0) 5 (inc (+ (1) 5)))))       
(inc (inc (inc (if (= 1 0) 5 (inc (+ (0) 5))))))            
(inc (inc (inc (inc (if (= 0 0) 5 (inc (+ (-1) 5)))))))    
(inc (inc (inc (inc (5)))))
(inc (inc (inc (6))))  
(inc (inc (7)))   
(inc 8) 
9       




; second implementation

(+ 4 5)
(if (= 4 0) 5 (+ (3) (6)))
(if (= 3 0) 6 (+ (2) (7)))
(if (= 2 0) 7 (+ (1) (8)))
(if (= 1 0) 8 (+ (0) (9)))
(if (= 0 0) 9 (+ (-1) (10))) = 9








