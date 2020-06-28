(load "huffman.scm")
(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
    (cond ((null? leaf-set) '())
            ((null? (cdr leaf-set)) (car leaf-set))
            (else
                (let ((new-tree (make-code-tree (car leaf-set) (cadr leaf-set))))
                     (successive-merge (adjoin-set new-tree (cddr leaf-set)))))))

