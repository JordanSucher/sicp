Exercise 3.47: A semaphore (of size n) is a generalization of
a mutex. Like a mutex, a semaphore supports acquire and
release operations, but it is more general in that up to n
processes can acquire it concurrently. Additional processes
that attempt to acquire the semaphore must wait for release
operations. Give implementations of semaphores

a. in terms of mutexes
b. in terms of atomic test-and-set! operations.


---

;this implementation uses a queue mutex to block operations and a count mutex to protect the counter from being accessed concurrently. if we reach n users, the count goes negative. while count < 0, the process tries to acquire the queue-mutex which blocks execution. when the semaphore is released, if there are processes "waiting", queue-mutex is released so one can proceed. 

(define (make-semaphore n)
  (let ((count n)
        (count-mutex (make-mutex))
        (queue-mutex (make-mutex)))
    (queue-mutex 'acquire) ; starts out locked
    (lambda (m)
      (cond ((eq? m 'acquire)
             (count-mutex 'acquire)
             (set! count (- count 1))
             (when (< count 0)
               (count-mutex 'release)
               (queue-mutex 'acquire))
             (count-mutex 'release))
            ((eq? m 'release)
             (count-mutex 'acquire)
             (set! count (+ count 1))
             (if (<= count 0)
                 (queue-mutex 'release)
                 (count-mutex 'release)))
            (else (error 'make-semaphore "unexpected message" m))))))


; this version uses a "spinning lock", where any processes trying to access the semaphore rotate through a lock until there is a 'seat' available (n > 0), at which point they decrement the seats and stop trying to access the spinning lock.

(define (make-semaphore-from-scratch n)
  (let ((count n)
        (cell (list #f)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (let retry () (when (test-and-set! cell) (retry)))
             (cond ((> count 0)
                    (set! count (- count 1))
                    (clear! cell))
                   (else (clear! cell)
                         (the-semaphore 'acquire)))) ; busy wait
            ((eq? m 'release)
             (let retry () (when (test-and-set! cell) (retry)))
             (set! count (+ 1 count))
             (clear! cell))
            (else (error 'make-semaphore-from-scratch "unexpected message" m))))
    the-semaphore))

---

(define (test-and-set! cell)
    (if (car cell) 
        true 
        (begin (set-car! cell true) false))
)

(define (make-mutex)
    (let ((cell (list false)))
        (define (the-mutex m)
            (cond 
                ((eq? m 'acquire) (if (test-and-set! cell) (the-mutex 'acquire))) ; retry
                ((eq? m 'release) (clear! cell)))
        )
        the-mutex
    )
)

(define (clear! cell) (set-car! cell false))

(define (make-serializer)
    (let ((mutex (make-mutex)))
        (lambda (p)
            (define (serialized-p . args)
                (mutex 'acquire)
                (let ((val (apply p args)))
                (mutex 'release)
                val
                )
            )
            serialized-p
        )
    )
)
