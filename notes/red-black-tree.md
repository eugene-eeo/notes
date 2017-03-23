---
title: Red Black Trees
---

Properties:

 - Balanced binary search tree.
 - Every node is either Red or Black.
 - All leaf nodes are black.
 - Children of a Red node must be Black.
 - Same number of black nodes from root to any leaf.

## Height Analysis

Let `$ B $` = number of black nodes from the root to the nearest leaf.
Then `$ B $` is also the number of black nodes from root to the furthest leaf.
The length of the longest path is then `$ 2B $` (black-red-black-red-...).
Hence we claim that the depth `$ d \leq 2B $`. Bounding `$ B $` is simple:

`$$
\begin{aligned}
n &= \sum^{B-1}_{d=0}{2^d} = 2^B - 1 \\
B &= \log_2{(n+1)}
\end{aligned}
$$`

Then we see that `$ d \leq 2\log_2{(n+1)} $`, as expected.

## Alternative Height Analysis

Let:

 - `$ N(v) $` = minimum no. of internal nodes of the subtree rooted at `$ v $`.
 - `$ bh(v) $` = no. of black nodes from root to node.
 - `$ h(v) $` = height of subtree rooted at `$ v $`.
 - `$ d $` = depth of the tree; `$ d \equiv h(\text{root}) $`.

**Claim:** `$ N(v) = 2^{bh(v)} - 1 $`

**Proof:** By induction. Basis:

`$$ h(v) = 0 \Rightarrow N(v) = 2^0 - 1 = 0 $$`

Then assume that it holds for some `$ h(v) = k $`. Now define some `$ v' $` such
that `$ h(v') = k + 1 $`. Then, `$ v' $` must have two children which might be
red or black. Since we're interested in the minimum number of internal nodes,
we can take the case that they're black:

`$$
\begin{aligned}
N(v') &= (2^{bh(v') - 1} - 1) + (2^{bh(v') - 1} - 1) + 1 \\
      &= 2^{bh(v')} - 1
\end{aligned}
$$`

Now we see that `$ n \geq N(\text{root}) = 2^{d / 2} - 1 $`,
because `$ d / 2 $` is the minimum number of black nodes from
the root to any leaf node. Then:

`$$
\begin{aligned}
\log_2{(n + 1)} &\geq d/2 \\
              d &\leq 2\log_2{(n+1)}
\end{aligned}
$$`
