---
title: palindromic primes
---

**Claim:** there are no palindromic primes in base 10 (primes that read the
same from back to front as front to back, e.g. 313) within the range [1000, 2000].

**Proof:** Assume that there is such a prime `$ p $`. Then by the definition
of a palindromic prime, `$ p $` must be in the form:

`$$
1000 + 100k + 10k + 1
$$`

where `$ k $` is any integer between 0 and 9, inclusive. One way to arrive at
the conclusion is to combine the middle terms of the equation, and then
factorise the common multiple 11:

`$$
\begin{aligned}
p &= 1000 + 110k + 1 \\
  &= 1000 + 109k + (k + 1) \\
  &= 999 + 108k + 2(k+1) \\
  &= (999 - 1) + (108 - 1)k + 3(k+1) \\
  &= (999 - 2) + (108 - 2)k + 4(k+1) \\
  &\ldots \\
  &= (999 - 108) + (108 + 2)(k+1) \\
  &= 891 + 110(k+1) \\
  &= 11(81 + 10(k+1))
\end{aligned}
$$`

Since `$ p $` is divisible by 11 then it is by definition, not a prime and
hence there is no palindromic prime within the range [1000, 2000].
