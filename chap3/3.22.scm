(define (make-queue)
    (let (
        (front-ptr '())
        (rear-ptr '())
    )
        (begin
            (define (empty-queue?)
                (null? front-ptr)
            )
            (define (front-queue)
                (if (empty-queue?)
                    (error "FRONT called with an empty queue" (cons front-ptr rear-ptr))
                    (car (front-ptr))
                ))

            (define (insert-queue! item)
                (let ((new-pair (cons item '())))
                    (cond (
                        (empty-queue?)
                        (set! front-ptr new-pair)
                        (set! rear-ptr new-pair)
                        '())
                    (else
                        (set-cdr! rear-ptr new-pair)
                        (set! rear-ptr new-pair)
                        '())
                    )))
            )
            (define (delete-queue!)
                (cond (
                    (empty-queue?)
                    (error "DELETE called with an empty queue" (cons front-ptr rear-ptr))
                    )
                (else
                    (set! front-ptr (cdr front-ptr))
                    '()
            )))
            (define (dispatch m)
            (cond ((eq? m 'front-ptr) front-ptr)
                ((eq? m 'rear-ptr) rear-ptr)
                ((eq? m 'set-front-ptr!) (lambda (item) (set! front-ptr item)))
                ((eq? m 'set-rear-ptr!) (lambda (item) (set! rear-ptr item)))
                ((eq? m 'empty-queue?) (empty-queue?))
                ((eq? m 'front-queue) (front-queue))
                ((eq? m 'insert-queue!) insert-queue!)
                ((eq? m 'delete-queue!) (delete-queue!))
                (else (error "INVALID OP" m))
            ))
            dispatch
    )
)

(define (print-queue queue)
    (begin
        (display (queue 'front-ptr))
        (newline)
    )
)