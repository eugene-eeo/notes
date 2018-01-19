---
title: gcd & lcm
---

Some proofs can be made more intuitive by defining the prime decomposition of a number
`$ n $` as follows: `$ \omega(n) $` = `$ [ p_1, p_2, \ldots, p_k ] $` where
`$ p_i $` is prime and `$ p_1 \leq p_2 \leq \ldots \leq p_k $`. Note that
`$ \omega(n) $` is a multiset. Assume that all set operations on the multiset
takes multiplicity into account.

**Claim:** `$ \text{gcd}(a, b) = \prod(\omega(a) \cap \omega(b)) $` <br/>
**Proof:** Let `$ m = \text{gcd}(a, b) $`. Since `$ a \mid b $` iff `$ \omega(a) \subseteq \omega(b) $`,
we have that `$ m \mid a $` and `$ m \mid b $`. Proving that `$ m $` is the GCD
relies on the fact that it is the biggest set that is a subset of both `$ \omega(a) $`
and `$ \omega(b) $`.

> **Claim:** There is no number `$ n $` s.t. `$ n \mid a $`, `$ n \mid b $`
> and `$ n > m $`. <br/>
> **Proof:** Assume that `$ n $` exists. So `$ \omega(m) \subset \omega(n) $`,
> i.e. we can find at least one `$ p \in \omega(n) $` and `$ p \notin \omega(m) $`.
> Since `$ n $` divides both `$ a $` and `$ b $`, we have `$ p \in \omega(a) $`
> and `$ p \in \omega(b) $`. However this means that `$ p \in \omega(a) \cap \omega(b) = \omega(m) $`,
> which is a contradiction.

Similarly we can define the LCM as `$ \text{lcm}(a, b) = \prod(\omega(a) \cup \omega(b)) $`,
and the proof is similar, by noting that `$ \omega(\text{lcm}(a, b)) $` is minimal.
