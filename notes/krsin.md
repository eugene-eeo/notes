---
title: kr-sin
---

`$$
p_0 + k \sin(ft + s) + \lambda \sum_{i=1}^{N}{\frac{1}{i^2}\,\text{R(i)}\,\sin(fit)}
$$`

where:

 - `$ p_0 $` - base price
 - `$ f $` - frequency
 - `$ s $` - time-shift
 - `$ \lambda $` - "kick"
 - `$ N $` - granularity
 - `$ \text{R(i)} $` - function that returns a random number between `$ [-1, 1] $`
