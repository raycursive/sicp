; element-of-set? identical

(define (adjoint-set x set) (cons x set))

; intersection-set identical
(define (union-set set1 set2) (append set1 set2))

;   operation  | non-dup | duplicated
;     Query    |   O(n)  |   O(n)
;    Adjoint   |   O(n)  |   O(1)
; Intersection |   O(n)  |   O(n)
;     Union    |   O(n)  |   O(1) (if append is optimized)
; Problem: extra memory cost
