---
title: Proofs in log(n)
---

**Problem 1:** prove that `$ \frac{1}{n+1} = \frac{1}{n} + O(\frac{1}{n^2}) $`. <br/>
**Solution:** rearrange to give `$ \frac{1}{n+1} - \frac{1}{n} = O(\frac{1}{n^2}) $`, which is true.

**Problem 2:** show that `$ \ln{(n+1)} = \ln{n} + \frac{1}{n} + O(\frac{1}{n^2}) $`. <br/>
**Solution:** using the equation from *Problem 1*, we have:

`$$
\ln{(n+1)} = \ln{n} + \frac{1}{n+1}
$$`

Play fast and loose with the notation; we claim the following:

`$$
\begin{aligned}
\ln{(n+1)} &= \Theta(\ln{n} + \frac{1}{n+1}) \\
           &= \Theta(\ln{n} + \ln{e^{\frac{1}{n+1}}}) \\
           &= \Theta(\ln{n \times e^{\frac{1}{n+1}}})
\end{aligned}
$$`

Take the exponential on both sides (i.e. just consider everything
within the `$ \ln{ \ldots } $` function). We must now show that
the following limit holds true, for some value of `$ \alpha $`:

`$$
\lim_{n \to \infty}{\frac{ n \times e^{\frac{1}{n+1}}}{ n+1 }} = \alpha
$$`

In fact we will prove a stronger bound with `$ \alpha = 1 $`:

`$$
\begin{aligned}
\lim_{n \to \infty}{\ldots}
 &= \lim_{n \to \infty}{\frac{ e^{\frac{1}{n+1}}}{ 1 + \frac{1}{n} }} \\
 &= 1
\end{aligned}
$$`

Therefore we have shown that `$ \ln{(n+1)} = \ln{n} + \frac{1}{n} + O(\frac{1}{n^2}) $`,
for a large enough `$ n $`.
