(define (front-asc-ptr deque) (caar deque))

(define (rear-asc-ptr deque) (cdar deque))

(define (front-desc-ptr deque) (cadr deque))

(define (rear-desc-ptr deque) (cddr deque))

(define (set-front-asc-ptr! deque item) (set-car! (car deque)))
(define (set-rear-asc-ptr! deque item) (set-cdr! (car deque)))
(define (set-front-desc-ptr! deque item) (set-car! (cdr deque)))
(define (set-rear-desc-ptr! deque item) (set-cdr! (cdr deque)))

(define (empty-deque? deque) (null? (front-asc-ptr deque)))

(define (make-deque) (cons (cons '() '()) (cons '() '())))


(define (front-deque deque)
    (if (empty-deque? deque)
        (error "FROMT called with an empty deque" deque)
        (car (front-asc-ptr queue))))

(define (rear-deque deque)
    (if (empty-deque? deque)
        (error "FROMT called with an empty deque" deque)
        (car (front-desc-ptr queue))))

(define (front-insert-deque! deque item)
    (let ((new-pair-asc (cons item '()))
          (new-pair-desc (cons item '())))
        (cond ((empty-deque? deque)
            (set-front-asc-ptr! deque new-pair-asc)
            (set-rear-asc-ptr! deque new-pair-asc)
            (set-front-desc-ptr! deque new-pair-desc)
            (set-rear-desc-ptr! deque new-pair-desc)
            deque)
        (else
            (set-front-asc-ptr! deque (cons item (front-asc-ptr deque)))
            (set-cdr! (rear-desc-ptr deque) new-pair-desc)
            (set-rear-desc-ptr! deque new-pair-desc)
            deque)
        )))

(define (rear-insert-deque! deque item)
    (let ((new-pair-asc (cons item '()))
          (new-pair-desc (cons item '())))
        (cond ((empty-deque? deque)
            (set-front-asc-ptr! deque new-pair-asc)
            (set-rear-asc-ptr! deque new-pair-asc)
            (set-front-desc-ptr! deque new-pair-desc)
            (set-rear-desc-ptr! deque new-pair-desc)
            deque)
        (else
            (set-front-rear-ptr! deque (cons item (front-desc-ptr deque)))
            (set-cdr! (rear-asc-ptr deque) new-pair-asc)
            (set-rear-asc-ptr! deque new-pair-asc)
            deque)
        )))

(define (front-delete-deque! deque)
    (cond (
        (empty-deque? deque)
        (error "DELETE! called with an empty deque" deque)
        )
    (else
        (set-front-asc-ptr! deque (cdr (front-asc-ptr deque)))
        (set-)
        ; (set-front-ptr! queue (cdr (front-ptr queue)))
        queue
    )))

; (define q (make-deque))
; (front-insert-deque! q 'a)