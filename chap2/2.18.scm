(load "append.scm")

(define (reverse lst)
  (if (null? lst)
    '()
    (append (reverse (cdr lst)) (list (car lst)))
  )
)

; (reverse (list 3 1 5 2))