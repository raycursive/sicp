(define (append fst snd)
  (if (null? fst)
    snd
    (cons (car fst) (append (cdr fst) snd))
  )
)