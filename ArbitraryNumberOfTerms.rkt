#lang racket

(require "dataRep.rkt")

;; Change representation of expressions to handle cases where more than
;; two terms are taken the derivative of


;; New definitions of augend and multiplicand
;; The idea is to create a new list from the third element onwards (including '+')
;; and take the derivative of that recursively (which happens intrinsically in deriv)
(define (augend s) 
  (let ((augend-element (cddr s))) ;; sub-list from the third element
    (if (null? (cdr augend-element)) 
        (car augend-element) 
        (cons '+ augend-element)))) ;; make a new list with '+' in the front
  
(define (multiplicand p) 
  (let ((multiplicand-element (cddr p))) 
    (if (null? (cdr multiplicand-element)) 
        (car multiplicand-element) 
        (cons '* multiplicand-element)))) 
