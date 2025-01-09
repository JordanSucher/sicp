Exercise 2.24: Suppose we evaluate the expression 
(list 1 (list 2 (list 3 4))). Give the result printed by the
interpreter, the corresponding box-and-pointer structure,
and the interpretation of this as a tree (as in Figure 2.6).


(1 (2 (3 4)))


(1 p1)
(2 p2)
(3 nil)
(4 nil)

as a tree, this has 4 leaves, and is 3 levels deep

            1
        2       *
            3       4





            