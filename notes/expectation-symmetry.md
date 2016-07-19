---
title: Expectation Symmetry
---

**Prove that `$ E(X) = a $` if PDF of `$ X $` is symmetric about `$ a $`.**
Assume that `$ E(X) $` exists, and let `$ X = a + Y $`. Then
`$ E(X) = a + E(Y) $`.

From the definition of `$ y $`, the PDF `$ f(y) $` is symmetric about
`$ y = 0 $`. So `$ Y $` has the same distribution as `$ -Y $`. Then
`$ E(Y) = E(-Y) = -E(Y) $`. So `$ E(Y) = 0 $`, hence `$ E(X) = a $`.
