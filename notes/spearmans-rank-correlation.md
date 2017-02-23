---
title: Spearman's Rank Correlation
---

Spearman's Rank Correlation (`$ r_s $`) between two rankings A and B
is given by:

`$$
r_s = 1 - \frac{6\sum{d^2}}{n(n^2 - 1)}
$$`

Considering the extreme values of `$ r_s $`:

 - 1 – no difference between A and B, i.e. perfectly positive correlation.
 - -1 – perfectly negative correlation, i.e. A is the complete opposite of B.
 For instance if `$ A = [1,2,3] $` and `$ B = [3,2,1] $`.

The -1 value is of interest because we can now show that for such A and B,
`$ \sum{d^2} \equiv 2n(n^2-1) / 6 $`. We will now consider the possible forms of
A and B. Only cases where `$ |A| $` is an even value need to be considered, because
when `$ |A| $` is odd, the middle rankings will be the same. Consider:

| A | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|---|---|---|---|---|---|---|---|---|
| B | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 |

Consider the sequence of differences up to where the 4th rank (A=4, B=5),
which is essentially `$ \sum{d^2}/2 $`:

`$$
7^2, 5^2, 3^2, 1^2
$$`

We can easily extend the sequence to size `$ n $`, to which we will find that
it becomes:

`$$
1^2, 3^2, 5^2, \ldots (2n-1)^2
$$`

Therefore it remains to show that:


`$$
\frac{1}{2}\sum{d^2} = \sum^{n/2}_{r=1}{(2r-1)^2} = \frac{n(n^2-1)}{6}
$$`

Which can be easily done with some algebra.
