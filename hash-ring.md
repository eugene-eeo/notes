---
title: Consistent Hash Rings
---

A hash ring is a ring from `$ [0, 1) $`. Given any hash function
we can define a new, ring-ified function `$ \text{hash}'(x) $`,
for a set of machine IDs `$ M = \{m_1, m_2, \ldots, m_n\} $`:

`$$
\text{hash}'(x) = \frac{1}{|M|} * \text{hash}(x)
$$`

For each `$ m_i $`, store `$ \text{hash}'(m_i) $` on the ring. To store
any value `$ v $` in the cluster, store it in the machine corresponding
to the lowest value of `$ m_i $` such that `$ m_i \leq \text{hash}'(v) $`
(clockwise). Then to 'scale up' the cluster it only suffices to re-hash
the machine IDs with a new `$ |M| $` and store it in the ring. Big
problem:

> If hash of `$ m_a $` and `$ m_b $` are very similar in value then one
> machine will end up getting most of the keys, while the other only a
> small subset. This is not desirable since it introduces tendency for
> single point of failure.

To solve this issue we can introduce a *replica count* parameter (not
related to data replication) `$ r $`. For each machine ID `$ m_i $`,
hash `$ (m_i, 1), (m_i, 2), \ldots, (m_i, r) $` and store it on the ring.
To store `$ v $` the same process is repeated, but we get more even
distribution of values.
