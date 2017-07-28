---
title: Decomposing Sums of Powers of 2
---

Consider the following summation:

`$$
S = 2^0 + 2^1 + 2^4 + 2^5
$$`

More generally given a set of exponents `$ E $`, for instance
in the previous example `$ E = \{ 0, 1, 4, 5 \} $`. More rigorously,
we can write:

`$$
S = \sum_{i \in E}{2^i}, \, E \subseteq \mathbb{Z}^{+}_{0}
$$`

**Claim:** there is one and only one unique `$ E $` given any
sum `$ S $`.

**Proof:** represent the sum in binary. See that to turn on the
`$ i $`-th bit in such a representation, `$ E $` must contain
`$ i-1 $`. Furthermore, every power of 2, `$ 2^{i-1} $` will turn
on the `$ i $`-th bit — and _only_ the `$ i $`-th bit.

`$$
D(S, k) = \begin{cases}
   \varnothing            & \text{if } S = 0, \\
   \{ k \} \cup D(S-1, k) & \text{if } S \text{ is odd}, \\
   D(S/2, k+1)            & \text{otherwise.}
\end{cases}
$$`

**Claim:** `$ D(S, 0) $` correctly computes the set of exponents `$ E $`.

**Proof:** By induction. Trivially, `$ D(0, 0) $` returns
the null set, which is correct. Now consider the set
`$ E = E' \cup \{ m \} $`, where `$ m = \min E $` and
`$ E' = E - \{ m \} $` (every element in `$ E $` other
than `$ m $`). We observe that:

`$$
S = 2^m + \sum_{i \in E'}{2^i}
$$`

After `$ m $` recursions, let the first argument to the
`$ D $` function be `$ S' $` and we see that

`$$
S' = 1 + \frac{1}{2^m} \sum_{i \in E'}{2^i}
$$`

So `$ S' $` will be odd and `$ m $` will be added to the
result set. In the next recursion notice that

`$$
S' = \frac{1}{2^m} \sum_{i \in E'}{2^i} = \sum_{i \in E'}{2^{i-m}}
$$`

which must be even because every element in `$ E' $` is
larger than `$ m $`. If `$ S' = 0 $` then the remaining set of
exponents is empty, and the algorithm terminates. The full
`$ E $` is recovered. The algorithm must terminate because
`$ S' = S/2 $` or `$ S-1 $` on each recursion.

## Notes

The direct translation of the function to pseudo-code is
given below, with a runtime of `$ O(|E| + \max E) $` since
for every element in `$ E $` we need to perform one extra
operation in `$ O(1) $` time.

```
Decompose(S, k)
   if S = 0:
      return ø
   if S is odd:
      return {k} ⋃ Decompose(S-1, k)
   return Decompose(S / 2, k+1)
```

A looser bouned is `$ O(\max E) $`, since the maximal element
is `$ \geq |E| $` (with the exception of `$ E = \{ 0 \} $`).
An iterative version (in Python) with the same runtime:

```
def decompose(S):
    k = 0
    E = []
    while S != 0:
        if S % 2 == 1:
            S -= 1
            E.append(k)
        S = S / 2
        k += 1
    return E
```
