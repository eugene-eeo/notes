---
title: Minimising Sample Sums
---

Prove that the sample mean `$ \mu $` will be the number that makes
the following sum have the smallest value, i.e. minimise the following
with respect to `$ y $` and `$ x_1, x_2, \ldots $`

`$$
S = \frac{1}{n} \sum_{i=1}^{n}{(x_n - y)^2}
$$`

**Intuition:**

0. The question is about distances - find some point `$ y $` that has the
   minimum distance from all the other points.
0. `$ \mu $` is the same as the midpoint of multiple numbers on a number
   line. Hence the smallest total distance possible for all the points
   from some point `$ y $` will be the midpoint itself, `$ \mu $`.

**Proof:** taking a partial deriviative for each of `$ x_i $` is not good
as we will end up with `$ n $` equations to solve. Finally the answer
should ideally be independent of the number of 'dimensions':

`$$
\frac{\delta S}{\delta y} = \frac{1}{n} (-2) \sum{(x_i - y)} = 0
$$`

Then isolate `$ y $` to one side of the equation:

`$$
\begin{aligned}
\sum{(x_i - y)} &= 0 \\
      \sum{x_i} &= n y \\
              y &= \frac{\sum{x_i}}{n} = \mu
\end{aligned}
$$`
