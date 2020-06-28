(load "2.67.scm")

(define (encode-symbol symbol tree)
    (define (_encode-symbol symbol curr node)
        (cond ((leaf? node) (reverse curr))
              ((memq symbol (symbols (left-branch node)))
                (_encode-symbol symbol (cons 0 curr) (left-branch node)))
              ((memq symbol (symbols (right-branch node)))
                (_encode-symbol symbol (cons 1 curr) (right-branch node)))
              (else (error "symbol not found" symbol))))
    (_encode-symbol symbol '() tree))

(define (encode message tree)
    (if (null? message)
        '()
        (append (encode-symbol (car message) tree)
                (encode (cdr message) tree))))

; A->0 B->10 C->111 D->110
; (display (encode-symbol 'D sample-tree))

; (display (encode '(a d a b b c a) sample-tree))
