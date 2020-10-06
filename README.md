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


The important idea is that we have encapsulated all these rules without bothering about the representation of algebraic expressions and built a procedure by esssentially assuming we have procedures like (sum?), (same-variable?), (product?) etc. Once these rules are decided, we figure out the representation of the expressions.

## Representing expressions
The encapsulated rules are embedded in the language we're using - Racket. We take advantage of this fact:
* Expressions in (Lisp & Scheme &) Racket are written using **list structure.** We can exploit the properties of this structure to represent algebraic expressions for the differentiator.
* Quotation is a feature which can be used to quote a data object and refer to it as a syntactic entity rather than semantic. It also allows us to type in compound objects.

Since, Racket uses parenthesized prefix notation for combinations. Therefore, we define the following constructors, selectors and predicates:
```

```
