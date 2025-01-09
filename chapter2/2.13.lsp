Exercise 2.13: Show that under the assumption of small
percentage tolerances there is a simple formula for the ap-
proximate percentage tolerance of the product of two in-
tervals in terms of the tolerances of the factors. You may
simplify the problem by assuming that all numbers are pos-
itive

int1 = center c1, tolerance p1

int2 = center c2, tolerance p2

a = c1-c1p1
b = c1+c1p1
c = c2-c2p2
d = c2+c2p2

product = (a*c, b*d)

(c1-c1p1)(c2-c2p2), (c1+c1p1)(c2+c2p2)

(c1c2 - c1c2p2 - c1c2p1 + c1c2p1p2), (c1c2 + c1c2p2 + c1c2p1 + c1c2p1p2)

center = (c1c2 + c1c2p2 + c1c2p1 + c1c2p1p2) + (c1c2 - c1c2p2 - c1c2p1 + c1c2p1p2) / 2

(2c1c2 + 2c1c2p1p2) / 2 
c1c2 + c1c2p1p2
c1c2 * (1 + p1p2)

width =  (c1c2 + c1c2p2 + c1c2p1 + c1c2p1p2) - (c1c2 - c1c2p2 - c1c2p1 + c1c2p1p2) / 2

(2c1c2p2 + 2c1c2p1 / 2)
c1c2p2 + c1c2p1
c1c2 * (p1 + p2)

product_p = c1c2 * (p1 + p2) / c1c2 * (1 + p1p2)

= (p1 + p2) / (1 + p1p2)

approx = p1+p2


