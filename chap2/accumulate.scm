(define (accumulate op init seq)
    (if (null? seq)
        init
        (op (car seq) (accumulate op init (cdr seq)))))