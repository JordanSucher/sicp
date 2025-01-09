Exercise 3.29: Another way to construct an or-gate is as
a compound digital logic device, built from and-gates and
inverters. Define a procedure or-gate that accomplishes
this. What is the delay time of the or-gate in terms of and-
gate-delay and inverter-delay?


(define a (make-wire))
(define b (make-wire))

(define na (make-wire))
(define nb (make-wire))

(inverter a na)
(inverter b nb)

(define c (make-wire))

(and-gate na nb c)

(define d (make-wire))

(inverter c d)

when a or b changes, we go through an invert, an and-gate, and another invert - so 
total delay is 2 * invert-delay + and-delay
---

(define (inverter input output)
    (define (invert-input)
        (let ((new-value (logical-not (get-signal input))))
        (after-delay inverter-delay
        (lambda () (set-signal! output new-value))))
    )
    (add-action! input invert-input) 
    'ok
)

(define (and-gate a1 a2 output)
    (define (and-action-procedure)
        (let 
            ((new-value (logical-and (get-signal a1) (get-signal a2))))
            (after-delay and-gate-delay (lambda () (set-signal! output new-value)))
        )
    )
    (add-action! a1 and-action-procedure)
    (add-action! a2 and-action-procedure)
    'ok
)

(define (logical-not s)
    (cond ((= s 0) 1)
    ((= s 1) 0)
    (else (error "Invalid signal" s)))
)
