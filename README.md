# Symbolic Differentiator

An implementation of Differential Calculus to illustrate symbol manipulation and data abstraction.

## Differentiation with abstract data
We first define a differentiation algorithm that operates on abstract objects such as “sums,” “products,” and “variables” without worrying about how these
are to be represented.

The following reduction rules can be applied to differentiate any algebraic sum or product:

<img src= "diff_rules.png" width=550 height=270>


> Clearly, the last two rules are **reductions** becuase each derivate produces two more derivatives which can be decomposed into smaller pieces, and thus can be solved by **recursion**.

To construct these rules, we assume that we have a _means_ for expressing algebraic expressions and therefore make three further assumptions:
* We can determine if an expression is a sum, a product, a constant or a variable.
* We can extract parts of the expression.
* We can construct expressions from these parts.

### Writing the `deriv` procedure
`deriv` takes as arguments a variable `var` with respect to which we evaluate the expression `exp`

```
(define (deriv exp var) ... 
```
A case analysis must be done for building a recursive solution. For example:

#### Rule 3
If the expression is a sum, then return the sum of the derivatives of the **addend** and the **augend**
```
(cond ((... ))
       ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
                              ...)
```

The final procedure: 
```
(define (deriv exp var)
       (cond ((constant? exp) 0)
              ((same-variable? exp var) 1))
              ((sum? exp) (make-sum (deriv (addend exp) var)
                                    (deriv (augend exp) var)))
              ((product? exp)
                 (make-sum
                   (make-product (multiplier exp)
                     (deriv (multiplicand exp) var))
                   (make-product (deriv (multiplier exp) var)
                     (multiplicand exp))))
              (else
                  (error "unknown expression type" exp))))
```


The important idea is that we have encapsulated all these rules without bothering about the representation of algebraic expressions and built a procedure by esssentially assuming these rules are given to us. Once these rules are decided, we figure out the representation of the expressions.

## Representing expressions
