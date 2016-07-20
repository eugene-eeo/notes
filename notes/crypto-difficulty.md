---
title: Crypto Difficulty
---

A common proof-of-work scheme is to find the value `$ v $` such that
for some hash function `$ h $`, `$ h(v) $` starts with `$ n $` number
of zeroes. The easiness (probability of getting a hash starting with
`$ n $` zeroes) falls exponentially. Assuming that the hash function
returns a string which has `$ s $` *possible* unique characters and
has length `$ N $`:

`$$
\begin{aligned}
\Pr(n) &= \frac{1}{s^n} \times \frac{s-1}{s} \times (\frac{s}{s})^{N-n-1} \\
       &= \frac{s - 1}{s^{n+1}} \\
\Pr(N) &= \frac{1}{s^N}
\end{aligned}
$$`

Interesting points:

 - Using a hash function with larger number of `$ N $` doesn't really
 help in terms of difficulty. It just makes it possible to scale up
 to a higher `$ n $`.
 - In order to really screw with nodes you want to use a hash function
 with a high `$ s $`. Unless you have `$ n = 0 $`, because difficulty
 of this `$ n $` falls with `$ s $`.
