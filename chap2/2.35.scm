(load "accumulate.scm")

(define (count-leaves node)
  (cond
    ((null? node) 0)
    ((not (pair? node)) 1)
    (else (+
        (count-leaves (car node))
        (count-leaves (cdr node))
        )
    )
  )
)
(define (count-leaves2 t)
  (accumulate + 0
        (map
          (lambda (sub_t)
            (if (pair? sub_t)
            (count-leaves2 sub_t)
            1))
          t)
    )
  )
; (display (count-leaves (list (list 1 2 3) (list (list 4 5) 6))))
; (newline)
; (display (count-leaves2 (list (list 1 2 3) (list (list 4 5) 6))))