Exercise 2.77: Louis Reasoner tries to evaluate the expres-
sion (magnitude z) where z is the object shown in Figure
2.24. To his surprise, instead of the answer 5 he gets an error
message from apply-generic, saying there is no method
for the operation magnitude on the types (complex). He
shows this interaction to Alyssa P. Hacker, who says “e
problem is that the complex-number selectors were never
defined for complex numbers, just for polar and rectangular
numbers. All you have to do to make this work is add the
following to the complex package:”

(put 'real-part '(complex) real-part)
(put 'imag-part '(complex) imag-part)
(put 'magnitude '(complex) magnitude)
(put 'angle '(complex) angle)

Describe in detail why this works. As an example, trace
through all the procedures called in evaluating the expres-
sion (magnitude z) where z is the object shown in Figure
2.24. In particular, how many times is apply-generic in-
voked? What procedure is dispatched to in each case?

The expression (magnitude z) fails initially because it results in a call to apply-generic. 
As per figure(mentioned in question), z is tagged with complex, thus apply-generic will lookup in the data directed table using get. Since magnitude is not stored in the table corresponding to complex, it results in error - “no method for the operation magnitude on the types (complex)”.

After adding the put statements, the error disappears because it adds magnitude to the table.

Now after the first call to apply-generic, it will result in (magnitude zz)
where zz is (content z). Thus zz is of type ‘rectangular` as can be seen form the figure.

Now this will again invoke apply-generic which will invoke magnitude 
from the rectangular package. And which will finally return the magnitude.

Thus there are two invocations of apply-generic.

