---
title: Negative Binomial Distribution
---

`$ X \sim NB(s,p) $` denotes a random variable equal to the number of
failures seen before the `$ s $`-th success in a series of random,
independent trials where the probability of success in each trial
is `$ p $`.

`$$
\Pr[X=x] = {{x+s-1}\choose{x}} p^s (1-p)^x
$$`

 - `$ x+s-1 $` - that there are `$ x+(s-1) $` trials, the last ends in a success.
 - `$ \binom{x+s-1}{x} $` - choose `$ x $` failures from `$ x+s-1 $` trials, `$ s-1 $` because
 we don't want to choose `$ s $` successes in a row prefixed by less than `$ x $` failures.
 - `$ p^s $` - there are `$ s $` successes.
 - `$ (1-p)^x $` - `$ x $` failures.

`$$ \mu = \frac{r(1-p)}{p} $$`
`$$ \sigma^2 = \frac{r(1-p)}{p^2} $$`
