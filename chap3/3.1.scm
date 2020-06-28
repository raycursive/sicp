(define (make-accumulator amount)
    (lambda (x)
        (begin
            (set! amount (+ x amount))
            amount
        )
    )
)

(define A (make-accumulator 5))
; (display (A 10))