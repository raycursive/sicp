(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest) result
            (iter (op result (car rest))
                  (cdr rest))))
  (iter initial sequence))


(define (fold-right op initial seq)
  (if (null? seq)
    initial
    (op (car seq) (fold-right op initial (cdr seq)))
  )
)
(define (reverse-right sequence)
(fold-right (lambda (x y) (append y (list x))) '() sequence))

; (display (reverse-right (list 1 2 3)))

(define (reverse-left sequence)
(fold-left (lambda (x y) (append (list y) x)) '() sequence))
; (display (reverse-left (list 1 2 3)))