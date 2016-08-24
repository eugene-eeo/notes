---
title: Reservoir sampling
---

**Problem:** given a sequence of `$ n $` elements, sample `$ k $`
elements such that each datum in the sample is selected with equal
probability.

**Solution:** for any `$ i $`th element in the sequence `$ S $`,
assume that we already have `$ k $` elements in the reservoir.
Then add it to the reservoir with probability `$ \frac{k}{i} $`.
This may overflow the reservoir, so if the element is added, an
existing element must be removed from the reservoir with probability
`$ \frac{1}{k} $`. The probability that an element will remain
in the reservoir is:

`$$
1 - \frac{k}{i} + \frac{k}{i} (1 - \frac{1}{k}) = \frac{i-1}{i}
$$`

By assumption, prob. of element being inside the reservoir is
`$ \frac{k}{i-1} $`. So the probability of an element being
sampled (i.e. being in the reservoir) is:

`$$
\frac{i-1}{i} \frac{k}{i-1} = \frac{k}{i}
$$`
