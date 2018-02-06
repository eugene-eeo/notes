---
title: Heapify Bounds
---

**Claim:** in the worst case, Heapify has time complexity `$ T(n) \leq T(\frac{2n}{3}) + \Theta(1) $`
when called on a heap with `$ n $` nodes.

    function Heapify(H, v, n)
        i <- v
        if 2v <= n and H[2v] > H[v]:
            i <- 2v
        if 2v+1 <= n and H[2v+1] > H[i]:
            i <- 2v + 1
        if i ≠ v:
           swap H[i], H[v]
           Heapify(H, i, n)

**Proof:** The hard part is pulling out the fraction `$ {2 \over 3} $`. The
`$ \Theta(1) $` is trivial. Consider an 'unbalanced' heap with the left
subtree larger than the right subtree (this can be the only unbalanced case
since heaps fill from left to right). In the worst case, the left subtree
has a full bottom layer while the right subtree has no bottom nodes.

<center><img src='http://scienceblogs.com/goodmath/wp-content/blogs.dir/476/files/2012/04/i-1f1c6859be504203721c6c61b4ade2a2-heap-example.png'/></center>

Say we start at some node at height `$ h $`. Let `$ |L| $` denote the number
of nodes in the left subtree and `$ |R| $` the number of nodes in the right
subtree. In the worst case we have:

`$$
\begin{aligned}
|L| &= \sum_{i=0}^{h-1}{2^i} = 2^h-1 \\
|R| &= \sum_{i=0}^{h-2}{2^i} = 2^{h-1} - 1 \\
\end{aligned}
$$`

The total number of nodes of the subtree rooted in the current node is given
by `$ |N| = 1 + |L| + |R| $` (add an extra 1 for the current node since that
is not included in the left or right subtrees). So in the worse case, we
recurse into the left subtree and end up with a subtree of `$ \frac{|L|}{|N|} $`
as many nodes as we have previously. Bounding this fraction:

`$$
\begin{aligned}
{|L| \over |N|} &\leq \lim_{n \to \infty}{\frac{|L|}{|N|}} \\
   &= \lim_{n \to \infty}{\frac{|L|}{1 + |L| + |R|}} \\
   &= \lim_{n \to \infty}{\frac{2^h-1}{1 + 2^h - 1 + 2^{h-1} - 1}} \\
   &= \lim_{n \to \infty}{\frac{2\cdot2^{h-1}-1}{2\cdot2^{h-1} + 2^{h-1} - 1}} \\
   &= \lim_{n \to \infty}{\frac{2\cdot2^{h-1}-1}{3\cdot2^{h-1} - 1}} \\
   &= \frac{2}{3}
\end{aligned}
$$`

As required. _Note:_ Even though we can recurse into a subtree that has `$ \frac{2}{3} $`
as many nodes as before, the algorithm is still logarithmic. Furthermore this
fraction only holds for the _first_ recursion, since on the next recursion we
will get half as many nodes on either side.
