(load "accumulate.scm")

(define (map p seq)
  (accumulate (lambda (x y) (cons (p x) y)) '() seq)
)
; (define (square x) (* x x))
; (display (map square (list 1 2 3)))

(define (append fst snd)
  (accumulate cons snd fst)
)
; (display (append (list 1 3 5) (list 2 4 6)))

(define (length seq)
  (accumulate (lambda (x y) (+ y 1)) 0 seq)
)
; (display (length (list 1 2 3 4)))