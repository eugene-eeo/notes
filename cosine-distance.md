---
title: Cosine Distance
---

A distance metric that can be applied to arbitrary dimensional data.
It can be used in recommendation systems. For instance given the
following data for how users A-D rate movies M1-M4:

<div style='float: left; margin-right: 1em;' markdown='1'>
|     | A | B | C | D |
|-----|---|---|---|---|
| M1  | 2 |   |   | 5 |
| M2  | 3 |   | 2 | 1 |
| M3  |   | 5 | 4 |   |
| M4  |   | 4 | 5 |   |
</div>

Express users' preferences as vectors of `$ \Bbb{R}^4 $`:

`$$
\begin{aligned}
A &= \langle 2, 3, 0, 0 \rangle \\
B &= \langle 0, 0, 5, 4 \rangle \\
C &= \langle 0, 2, 4, 5 \rangle \\
D &= \langle 5, 1, 0, 0 \rangle \\
\end{aligned}
$$`

To find out the two most similar users, we can use the cosine distance
formula, given two vectors `$ A $` and `$ B $`:

`$$
\frac{a_1 b_1 + a_2 b_2 + \ldots}{\sqrt{a_1^2 + a_2^2 + \ldots} \sqrt{b_1^2 + b_2^2 + \ldots}} = \frac{A \cdot B}{|A||B|} = \cos\theta
$$`

The best case is that the two users have exactly the same interests and
their 'preference vectors' are collinear (`$ \cos\theta = 1 $`). Example
calculation for users B and D, to show that they are 'completely
different':

`$$
\frac{0 * 5 + 0 * 1 + 5 * 0 + 4 * 0}{\sqrt{5^2 + 4^2} \sqrt{5^2 + 1^2}} = 0
$$`
