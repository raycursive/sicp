; 2.58-inverse
(define (simple-infix exp)
    (let (
        (operator (car exp))
        (left (cadr exp))
        (right (caddr exp))
    )
        (define (extract exp) (if (list? exp) (simple-infix exp) exp))
        (list (extract left) operator (extract right))
    )
)
; (display (simple-infix '(+ (* x y) (* y (+ x 3)))))

;Diff
(define (=number? exp num) (and (number? exp) (= exp num)))
(define variable? symbol?)
(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

;2.58 b

;predicates
(define (has-plus? exp)
    (if (null? exp)
        false
        (or (eq? (car exp) '+) (has-plus? (cdr exp)))))
(define sum? has-plus?)

(define (has-asterisk? exp)
    (if (null? exp)
        false
        (or (eq? (car exp) '*) (has-asterisk? (cdr exp)))))
(define (product? exp)
    (and (not (has-plus? exp)) (has-asterisk? exp)))

;constructors
(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list a1 '+ a2))))

(define (make-product a1 a2)
    (cond ((or (=number? a1 0) (=number? a2 0)) 0)
          ((=number? a1 1) a2)
          ((=number? a2 1) a1)
          ((and (number? a1) (number? a2)) (* a1 a2))
          (else (list a1 '* a2))))

;selectors
(define (iter_find symb lst prev)
    (let (
        (x (car lst))
        (xs (cdr lst))
    ) (if (eq? x symb)
          (cons (reverse prev) xs)
          (iter_find symb xs (cons x prev)))
    ))
(define (parse entry)
    (if (and (list? entry) (null? (cdr entry)))
        (car entry)
        entry
    ))
(define (addend s) (parse (car (iter_find '+ s '()))))
(define (augend s) (parse (cdr (iter_find '+ s '()))))

(define (multiplier s) (parse (car (iter_find '* s '()))))
(define (multiplicand s) (parse (cdr (iter_find '* s '()))))

(define (deriv exp var)
    (cond ((number? exp) 0)
    ((variable? exp) (if (same-variable? exp var) 1 0))
    ((sum? exp) (make-sum (deriv (addend exp) var)
                          (deriv (augend exp) var)))
    ((product? exp)
        (make-sum
            (make-product (multiplier exp)
                          (deriv (multiplicand exp) var))
            (make-product (multiplicand exp)
                          (deriv (multiplier exp) var))))
    (else (error "UNKNOWN expression type: DERIV" exp))))

(display (deriv '(x + 3 * 2 * x + x) 'x))