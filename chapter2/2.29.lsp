Exercise 2.29: A binary mobile consists of two branches,
a left branch and a right branch. Each branch is a rod of
a certain length, from which hangs either a weight or an-
other binary mobile. We can represent a binary mobile us-
ing compound data by constructing it from two branches
(for example, using list):

(define (make-mobile left right)
    (list left right)
)

A branch is constructed from a length (which must be a
number) together with a structure, which may be either a
number (representing a simple weight) or another mobile:

(define (make-branch length structure)
    (list length structure)
)

a. Write the corresponding selectors left-branch and
right-branch, which return the branches of a mobile,
and branch-length and branch-structure, which re-
turn the components of a branch.

(define (left-branch mob) (car mob))
(define (right-branch mob) (car(cdr mob)))

(define (branch-length br) (car br))
(define (branch-structure br) (car(cdr br)))

b. Using your selectors, define a procedure total-weight
that returns the total weight of a mobile.

(define (total-br-weight br)
        (if (list? (branch-structure br)) 
            (total-mob-weight (branch-structure br))
            (branch-structure br)
        )
)

(define (total-mob-weight mob)
    (+ (total-br-weight (left-branch mob)) (total-br-weight (right-branch mob)))
)


c. A mobile is said to be balanced if the torque applied by
its top-left branch is equal to that applied by its top-
right branch (that is, if the length of the left rod mul-
tiplied by the weight hanging from that rod is equal
to the corresponding product for the right side) and if
each of the submobiles hanging oﬀ its branches is bal-
anced. Design a predicate that tests whether a binary
mobile is balanced.

(define (balanced? mob)
    (and
        (=
            (* (total-br-weight (left-branch mob)) (branch-length (left-branch mob)))
            (* (total-br-weight (right-branch mob)) (branch-length (right-branch mob)))
        )
        (if (list? (branch-structure (left-branch mob)))
            (balanced? (branch-structure (left-branch mob)))
            #t
        )
        (if (list? (branch-structure (right-branch mob)))
            (balanced? (branch-structure (right-branch mob)))
            #t
        )
    )
)

d. Suppose we change the representation of mobiles so
that the constructors are

(define (make-mobile left right) (cons left right))

(define (make-branch length structure)
    (cons length structure)
)

How much do you need to change your programs to
convert to the new representation?

I should only need to change the selectors.

; balanced mobiles

(define (make-branch length structure)
    (list length structure)
)

(define (make-mobile left right)
    (list left right)
)

(define a (make-branch 5 8))
(define b (make-branch 4 10))

(define c (make-branch 2 3))
(define d (make-branch 3 2))


(define mob1 (make-mobile a b))
(define mob2 (make-mobile c d))


