#lang racket/gui
(provide (all-defined-out))

;; variables are symbols
(define (variable? x) (symbol? x)) 

;; Two variables are the same if the symbols representing them are equal 
(define (same-variable? v1 v2) 
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;; Checks if expression is equal to a given number
(define (=number? exp num) 
  (and (number? exp) (= exp num))) 

;; Sums and products constructed using lists mirroring parenthesized prefix notation t
(define (make-sum a1 a2) 
  (cond ((=number? a1 0) a2) 
        ((=number? a2 0) a1) 
        ((and (number? a1) (number? a2)) (+ a1 a2)) 
        (else (list '+ a1 a2)))) 
  
(define (make-product m1 m2) 
  (cond ((or (=number? m1 0) (=number? m2 0)) 0) 
        ((=number? m1 1) m2) 
        ((=number? m2 1) m1) 
        ((and (number? m1) (number? m2)) (* m1 m2)) 
        (else (list '* m1 m2))))

;; A sum is alist whose first element is '+'
(define (sum? x) 
  (and (pair? x) (eq? (car x) '+))) 
  
(define (addend s) (cadr s)) 
  
(define (augend s) (caddr s))

;; A product is list whose first element is '*'
(define (product? x) 
  (and (pair? x) (eq? (car x) '*))) 
  
(define (multiplier p) (cadr p)) 
  
(define (multiplicand p) (caddr p))

;; An exponentiation is a list with only two elements whose first element is '**' 
(define (exponentiation? exp) 
  (and (pair? exp) (eq? (car exp) '**)))

(define (base exp) (cadr exp)) 
   
(define (exponent exp) (caddr exp))

;; If exponent is 1 or 0, then return base or 1 repsectively
(define (make-exponentiation base exp) 
  (cond ((=number? base 1) 1) 
        ((=number? exp 1) base) 
        ((=number? exp 0) 1) 
        (else  
         (list '** base exp)))) 