(define (make-node item) (cons (cons '() '()) item))
(define (value node) (cdr node))
(define (prev node) (car (car node)))
(define (next node) (cdr (car node)))
(define (set-prev! node item) (set-car! (car node) item))
(define (set-next! node item) (set-cdr! (car node) item))

(define (head deque) (car deque))
(define (tail deque) (cdr deque))

(define (set-head! deque item) (set-car! deque item))
(define (set-tail! deque item) (set-cdr! deque item))

(define (empty-deque? deque) (null? (head deque)))

(define (make-deque) (cons '() '()))


(define (front-deque deque)
    (if (empty-deque? deque)
        (error "FROMT called with an empty deque" deque)
        (value (head deque))))

(define (rear-deque deque)
    (if (empty-deque? deque)
        (error "FROMT called with an empty deque" deque)
        (value (tail deque))))

(define (front-insert-deque! deque item)
    (let ((new-node (make-node item)))
        (cond ((empty-deque? deque)
            (set-head! deque new-node)
            (set-tail! deque new-node)
            '())
        (else
            (set-next! new-node (head deque))
            (set-prev! (head deque) new-node)
            (set-head! deque new-node)
            '())
        )))

(define (rear-insert-deque! deque item)
    (let ((new-node (make-node item)))
        (cond ((empty-deque? deque)
            (set-head! deque new-node)
            (set-tail! deque new-node)
            '())
        (else
            (set-next! (tail deque) new-node)
            (set-prev! new-node (tail deque))
            (set-tail! deque new-node)
            '())
        )))

(define (front-delete-deque! deque)
    (cond (
        (empty-deque? deque)
        (error "DELETE! called with an empty deque" deque)
        )
    (else
        (set-head! deque (next (head deque)))
        (set-next! (prev (head deque)) '())
        (set-prev! (head deque) '())
        '()
    )))

(define (rear-delete-deque! deque)
    (cond (
        (empty-deque? deque)
        (error "DELETE! called with an empty deque" deque)
        )
    (else
        (set-tail! deque (prev (tail deque)))
        (set-prev! (next (tail deque)) '())
        (set-next! (tail deque) '())
        '()
    )))


(define (helper n) (if (null? n) '() (cons (value n) (helper (next n)))))
(define (print-deque q) (helper (head q)))

(define q (make-deque))
(front-insert-deque! q 'b)
(front-insert-deque! q 'a)
(display (print-deque q))
(newline)
; (a b)
(rear-insert-deque! q 'c)
(display (print-deque q))
(newline)
; (a b c)

(front-delete-deque! q)
(display (print-deque q))
(newline)

(rear-delete-deque! q)
(display (print-deque q))
(newline)