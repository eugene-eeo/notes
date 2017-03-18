---
title: AVL Trees
---

 - balanced binary search tree
 - **AVL property:** for every internal node `$ v $`, the heights of the
 children of `$ v $` differ by at most 1.

## Height

Let `$ N(h) $` be the minimum number of internal nodes of an AVL tree
with height `$ h $`. A tree with height `$ h > 2 $` is a node joining
two subtrees with heights `$ h - 1 $` and `$ h - 2 $`, from the AVL
property. So we have:

`$$
\begin{aligned}
N(h) &= 1 + N(h-1) + N(h-2) \\
N(2) &= 2 \\
N(1) &= 1
\end{aligned}
$$`

From `$ N(h-1) > N(h-2) $`, we get:

`$$
\begin{aligned}
N(h) &> 2N(h-2) \\
     &> 4N(h-4) \\
     &> 8N(h-6) \\
     &\ldots    \\
     &> 2^i N(h-2i)
\end{aligned}
$$`

Plugging in `$ i = h/2 - 1 $` so that we get one of the base cases,

`$$
N(h) > 2^{h/2 - 1} N(2) = 2^{h/2}
$$`

Then take logarithms:

`$$
\begin{aligned}
\log_2 N(h) &> h/2 \\
          h &< 2 \log_2 N(h) \\
          h &= O(\log n)
\end{aligned}
$$`

### Tighter Bound

**Claim:** `$ N(h) \geq \varphi^h $`, where `$ \varphi = (1 + \sqrt{5}) / 2 $`
(the golden ratio).

**Intuition:** `$ N(h) = 1 + N(h-1) + N(h-2) $`. This means it's greater
than the Fibonacci series for `$ h \geq 2 $`, since `$ F(h) = F(h-1) + F(h-2) $`.
We know that the `$ h $`th Fibonacci number is `$ \Theta(\varphi^h) $`.

**Proof:** By induction on `$ h $`.

`$$
\begin{aligned}
h = 0, \,& N(0) = 1 \geq \varphi^0 \\
h = 1, \,& N(1) = 2 \geq \varphi^1 \\
\end{aligned}
$$`

Assume it holds for `$ h $`. Then for `$ h + 1 $` (note the use of
`$ \varphi + 1 = \varphi^2 $`):

`$$
\begin{aligned}
N(h + 1) &= 1 + N(h-1) + N(h) \\
         &\geq 1 + \varphi^{h-1} + \varphi^{h} \\
         &= 1 + \varphi^{h-1}(1 + \varphi) \\
         &= 1 + \varphi^{h+1} \\
         &\gt \varphi^{h+1}
\end{aligned}
$$`

Again cleaning up and using the claim:

`$$
\begin{aligned}
n &\geq N(h) \geq \varphi^{h} \\
h &\leq \log_\varphi{n} \\
  &= \frac{\log_2{n}}{\log_2{\varphi}} = 1.44 \log{n}
\end{aligned}
$$`

## Restructuring

Let `$ (a, b, c) $` be an in-order listing of `$ x, y, z $`.
Then we need to perform rotations to make `$ b $` the topmost
node of the three. We need to consider two cases:

 - `$ b $` is a right child node of `$ a $` and `$ c $` is a
 right child node of `$ b $` (single rotation). Then we need
 to restructure `$ b $` so that `$ a $` is its left child and
 `$ c $` its right.

 - `$ a $` has a right child `$ c $` and `$ c $` has a right
 child `$ b $` (double rotation). Again we need to restructure
 so that we have `$ b $` as the parent of `$ a, c $`.

The restructuring operations are symmetric for the case where
`$ b $` is the left child of `$ c $`. A simple analysis of the
running time for restructuring follows.

**Claim:** Inserting and rebalancing the tree (so that the AVL
invariant holds) can be done in `$ O(\log n) $` time.

**Proof:** A simple strategy to rebalance is as follows:

0. Let `$ w $` be a node that is inserted (therefore, a leaf node).
0. Let `$ h $` denote the parent of `$ w $`.
0. Restructure `$ h $` by single or double rotation as necessary.
0. Then rebalance the parent of `$ h $`, and so on until we reach
   the root of the tree.

Inserting into a balanced tree is always `$ O(\log n) $`. Since single
and double rotation is a `$ O(1) $` operation, and the height of the
tree is at most, `$ O(\log n) $`, then at worse we need to restructure
`$ O(\log n) $` times.
