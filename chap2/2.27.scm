(load "append.scm")

(define (deep-reverse lst)
  (let
    (
      (aux (lambda (remain) (append (deep-reverse (cdr lst)) (list remain))))
    )
    (cond
      ((null? lst) '())
      ((not (pair? (car lst))) (aux (car lst)))
      (else (aux (deep-reverse (car lst))))
    ; ((null? lst) '())
    ; ((not (pair? (car lst))) (append (deep-reverse (cdr lst)) (list (car lst))))
    ; (else (append (deep-reverse (cdr lst)) (list (deep-reverse (car lst)))))
    )
  )
)

; (display (deep-reverse (list (list 1 2) (list 3 4))))
