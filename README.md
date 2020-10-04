# Symbolic Differentiator

An implementation of Differential Calculus to illustrate symbol manipualtion and data abstraction.

## Differentiation with abstract data
We first define a differentiation algorithm that operates on abstract objects such as “sums,” “products,” and “variables” without worrying about how these
are to be represented.

The following reduction rules can be applied to differentiate any algebraic sum or product:

<img src= "diff_rules.png" width=650 height=350>


> Clearly, the last two rules are **reductions** becuase each derivate produces two more derivatives which can be decomposed into smaller pieces, and thus can be solved by **recursion**.

To construct these rules, we assume that we have a _means_ for expressing algebraic expressions and therefore make three further assumptions:
* We can determine if an expression is a sum, a product, a constant or a variable.
* We can extract parts of the expression.
* We can construct expressions from these parts.
