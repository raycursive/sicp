(load "queue.scm")
(define q1 (make-queue))

; (insert-queue! q1 'a)
; (display q1)
; (newline)

; (insert-queue! q1 'b)
; (display q1)
; (newline)

; (delete-queue! q1)
; (display q1)
; (newline)

; (delete-queue! q1)
; (display q1)
; (newline)

(define (print-queue queue) (begin
    (display (front-ptr q1))
    (newline)
))

; (insert-queue! q1 'a)
; (print-queue q1)

; (insert-queue! q1 'b)
; (print-queue q1)

; (delete-queue! q1)
; (print-queue q1)

; (delete-queue! q1)
; (print-queue q1)