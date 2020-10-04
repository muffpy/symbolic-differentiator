# Symbolic Differentiator

An implementation of Differential Calculus to illustrate symbol manipualtion and data abstraction.

### Differentiation with abstract data
We first define a differentiation algorithm that operates on abstract objects such as “sums,” “products,” and “variables” without worrying about how these
are to be represented.

The following reduction rules can be applied to differentiate any algebraic sum or product:

<img src= "diff_rules.png" width=650 height=350>


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

Let us begin a case analysis, of each rule, for building a recursive solution - 
#### Rule 1
If the expression is a constant _with respect_ to the varaible, return 0
```
(cond ((constant? exp var) 0) ...)
```
#### Rule 2
If the expression is the variable which is get varied, return 1
```
(cond ((...)
       ((same-variable? exp var) 1) ...)
```
#### Rule 3
If the expression is a sum, then return the sum of the derivatives of the **addend** and the **augend**
```
(cond ((... ))
       ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
                              ...)
```
#### Rule 4
If the expression is a product, then return the sum of the derivatives of the **multiplier** and the **multiplicand**
```
(cond ((... ))
      ((product? exp)
          (make-sum
            (make-product (multiplier exp)
              (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var)
              (multiplicand exp))))
        
