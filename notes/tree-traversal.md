---
title: Tree Traversal Space Requirements
---

For a tree with `$ n $` total nodes, where each node has `$ \mu $`
average number of children, and `$ D $` is the depth/height of the
tree, we can write (the summation is from 0 because of the root node):

`$$
n \approx \sum_{d=0}^{D}{\mu^d}
$$`

Given a "perfect" tree where each node has `$ \mu $` children, the
maximum number of nodes we need to inspect, given breadth first
traversal is the number of nodes in the last depth, `$ \mu^D $`.
Rearranging to find `$ \mu^D $` in terms of `$ n $`:

`$$
n = \sum_{d=0}^{D}{\mu^d} = \frac{\mu^{D+1} - 1}{\mu - 1}
$$`

`$$
\mu^D = \frac{n (\mu - 1) + 1}{\mu}
$$`

I think a good approximation that makes breadth-first algorithms
look quite bad is then:

`$$
O(n(1 - \frac{1}{\mu})) \approx O(n)
$$`

For the same conditions, a depth first traversal is much cheaper.
We need only to store `$ D $` items in memory (just for traversing).
So the space required is given by:

`$$
\begin{aligned}
D &= \log_{\mu}{\frac{n (\mu - 1) + 1}{\mu}} \\
  &= \log_{\mu}{(n (\mu - 1) + 1)} - 1
\end{aligned}
$$`

And a good approximation is then:

`$$
O(\log{(\mu n)}) \approx O(\log{n})
$$`
