---
title: Consistent Hash Rings
---

A hash ring is a ring from `$ [0, 1) $`. Given any hash function that
has the range `$ [0, R) $` we can define a new, ring-ified function
`$ h(x) $`:

`$$
h(x) = \frac{\text{hash}(x)}{R}
$$`

For each `$ m_i $` in a set of machine IDs `$ M = \{m_1, m_2, \ldots,
m_n\} $`, store `$ h(m_i) $` on the ring. To store any value
`$ v $` in the cluster, store it in the machine corresponding to the
highest value of `$ m_j $` such that `$ m_j \leq h(v) $` (clockwise).
Then to 'scale up' the cluster, just hash and store the ID of the new
machine on the ring. Problem:

> If `$ h(m_a) $` and `$ h(m_b) $` are very similar in value then one
> machine will end up getting most of the keys, while the other only a
> small subset. This is not desirable since it increases the tendency
> for a single point of failure.

Solution: a *replica count* parameter (not related to data replication)
`$ r $`. For each machine ID `$ m_i $`, hash `$ (m_i, 1), (m_i, 2),
\ldots (m_i, r) $` and store it on the ring. To store `$ v $` the same
process is repeated, but we get more even distribution of values.
