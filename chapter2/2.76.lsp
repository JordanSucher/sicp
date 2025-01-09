Exercise 2.76: As a large system with generic operations
evolves, new types of data objects or new operations may
be needed. For each of the three strategies—generic opera-
tions with explicit dispatch, data-directed style, and message-
passing-style—describe the changes that must be made to a
system in order to add new types or new operations. Which
organization would be most appropriate for a system in
which new types must oen be added? Which would be
most appropriate for a system in which new operations
must oen be added?

Generic Operations with Explicit Dispatch:

Adding new type: Must modify EVERY existing operation to add a new case
Adding new operation: Create one new procedure that handles ALL existing types

Example:

(define (op-name arg)
  (cond ((type1? arg) (op-type1 arg))
        ((type2? arg) (op-type2 arg))
        ; Must add new type here
        (else ...)))


Data-Directed Style:

Adding new type: Just install new type's operations in the operation-type table
Adding new operation: Must write and install implementation for EVERY type

Example:

(put 'op 'type1 type1-op)
(put 'op 'type2 type2-op)
; Types are independent


Message-Passing Style:

Adding new type: Create new package with ALL operations (easy)
Adding new operation: Must modify EVERY existing type package

Example:

(define (make-type1 x)
  (define (dispatch op)
    (cond ((eq? op 'op1) ...)
          ((eq? op 'op2) ...)
          ; Must add new op here
          (else ...)))
  dispatch)



Analysis:

If adding new TYPES frequently:

Message-passing or data-directed is best
Because you just create a new independent package
Explicit dispatch requires modifying existing code (dangerous!)

If adding new OPERATIONS frequently:

Explicit dispatch is best
Because you create one new independent procedure
Other approaches require modifying multiple existing packages

Therefore:

For new types: Data-directed or message-passing
For new operations: Explicit dispatch
