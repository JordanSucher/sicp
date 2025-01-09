Exercise 2.9: The width of an interval is half of the diﬀer-
ence between its upper and lower bounds. The width is a
measure of the uncertainty of the number specified by the
interval. For some arithmetic operations the width of the
result of combining two intervals is a function only of the
widths of the argument intervals, whereas for others the
width of the combination is not a function of the widths of
the argument intervals. Show that the width of the sum (or
diﬀerence) of two intervals is a function only of the widths
of the intervals being added (or subtracted). Give examples
to show that this is not true for multiplication or division.


x = (2, 6), width = 4
y = (4, 8), width = 4

a = (3, 7)
b = (5, 9)

(sub x y)
((- 2 8), (- 6 4))
(-6, 2), width = 8

(sub a b)
((- 3 9), (- 7 5))
(-6, 2), width = 8

---

(add x y)
((+ 2 4), (+ 6 8))
(6, 14), width = 8

(add a b)
((+ 3 5) (+ 7 9))
(8, 16), width = 8

(mult x y)
((* 2 4) (* 2 8) (* 6 4) (* 6 8))
(8 16 24 48)
(8, 48), width = 40

(mult a b)
((* 3 5) (* 3 9) (* 7 5) (* 7 9))
(15 27 35 63)
(15, 63), width = 48
