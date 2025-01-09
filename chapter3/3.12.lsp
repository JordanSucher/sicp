Exercise 3.12: e following procedure for appending lists
was introduced in Section 2.2.1:
(define (append x y)
(if (null? x)
y
(cons (car x) (append (cdr x) y))))
append forms a new list by successively consing the el-
ements of x onto y. e procedure append! is similar to
append, but it is a mutator rather than a constructor. It ap-
pends the lists by splicing them together, modifying the fi-
nal pair of x so that its cdr is now y. (It is an error to call
append! with an empty x.)

(define (append! x y)
(set-cdr! (last-pair x) y)
x)

Here last-pair is a procedure that returns the last pair in
its argument:

(define (last-pair x)
    (if (null? (cdr x)) x (last-pair (cdr x)))
)

Consider the interaction

(define x (list 'a 'b))
(define y (list 'c 'd))

(define z (append x y))

z
(a b c d)
(cdr x)
⟨response⟩
;b

(define w (append! x y))

w
(a b c d)
(cdr x)
⟨response⟩
;b c d

