(define (lookup given-key tree)
    (if (null? tree)
        false
        (let ((entry-key (key (entry tree))))
            (cond ((= given-key entry-key) (entry tree))
                  ((> given-key entry-key) (lookup given-key (right tree)))
                  ((< given-key entry-key (lookup given-key (left tree))))))))