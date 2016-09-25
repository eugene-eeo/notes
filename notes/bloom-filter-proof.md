---
title: Bloom Filter Proof
---

Prove that, for a `$ m $`-length bit array (Bloom Filter) which already has
seen `$ n $` insertions, and has `$ k $` hash functions, that:

`$$
k = \frac{m}{n} \ln{2}
$$`

is the optimal (minimises the number of false positives) number of hash
functions to use. First, the probability that a bit is still 0 (assuming that
the prob. of a bit being set is independent) after `$ n $` insertions:

`$$
(1 - \frac{1}{m})^{kn} \approx e^{-\frac{kn}{m}}
$$`

Approximation (for convenience) is from the Macluarin Expansion of `$ e^x $`:

`$$
\begin{aligned}
e^x = 1 + \frac{x}{1!} + \frac{x^2}{2!} + \ldots \\
e^{-\frac{1}{m}} = 1 - \frac{1}{m} + \frac{1}{m^2 \cdot 2!} + \ldots
\end{aligned}
$$`

Similarly, the probability that a bit is 1 given the conditions above
is simply `$ 1 - e^{-\frac{kn}{m}} $`. Because the algorithm tests
membership via testing `$ k $` bits, the probability for a false
positive is:

`$$
E = (1 - e^{-\frac{kn}{m}})^k
$$`

Then we need to minimise `$ E $` wrt `$ k $` for a fixed `$ m $` and `$ n $`.

`$$
\begin{aligned}
\ln{E} &= k \ln{(1 - e^{-\frac{kn}{m}})} \\
\frac{dE}{dk} \frac{1}{E} &= \ln{(1 - e^{-\frac{kn}{m}})} + \frac{\frac{kn}{m} e^{-\frac{kn}{m}}}{1 - e^{-\frac{kn}{m}}} \\
\frac{dE}{dk} &= (1 - e^{-\frac{kn}{m}})^k \Big[ \ln{(1 - e^{-\frac{kn}{m}})} + \frac{kn e^{-\frac{kn}{m}}}{m(1 - e^{-\frac{kn}{m}})} \Big] = 0 \\
\end{aligned}
$$`

But because `$ E $` is greater than 0 for all values of `$ k $`, so we
only have to solve for the uglier expression in square brackets. Make
the following substitution to remove the fluff:

`$$
\begin{aligned}
a &= 1 - e^{-\frac{kn}{m}} \\
\ln{a} - \ln{(1-a)} \cdot \frac{1-a}{a} &= 0 \\
\ln{(1-a)} \cdot \frac{1-a}{a} &= \ln{a} \\
(1 - a) \ln{(1 - a)} &= a \ln{a} \\
1 - a &= a \\
a &= \frac{1}{2}
\end{aligned}
$$`

Then just substitute it back to get an answer with the fluff:

`$$
\begin{aligned}
e^{-\frac{kn}{m}} &= \frac{1}{2} \\
-\frac{kn}{m} &= - \ln{2} \\
k &= \frac{m}{n} \ln{2}
\end{aligned}
$$`
