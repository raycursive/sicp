(define (equal? fst snd)
    (cond
        ((and (null? fst) (null? snd)) true)
        ((and (list? fst) (list? snd)) (and (equal? (car fst) (car snd))
                                            (equal? (cdr fst) (cdr snd))))
        (else (eq? fst snd))
    )
)