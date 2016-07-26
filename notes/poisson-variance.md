---
title: Poisson Variance
---

**Problem: prove that `$ E(X) = \lambda $`**, where
`$ X \sim \text{P}_\text{o}(\lambda) $`. Proof:

`$$
\begin{aligned}
E(X^2) &= \sum_{x=0}^{\infty}{x^2 e^{-\lambda} \frac{\lambda^x}{x!}} \\
  &= e^{-\lambda} \sum_{x=0}^{\infty}{x^2 \frac{\lambda^x}{x!}} \\
  &= \lambda e^{-\lambda} \sum_{x=1}^{\infty}{x \frac{\lambda^{x-1}}{(x-1)!}} \\
  &= \lambda e^{-\lambda} \left(\sum_{x=1}^{\infty}{(x - 1) \frac{\lambda^{x-1}}{(x-1)!}} + \sum_{x=1}^{\infty}{\frac{\lambda^{x-1}}{(x-1)!}} \right)\\
  &= \lambda e^{-\lambda} \left(\lambda \sum_{x=2}^{\infty}{\frac{\lambda^{x-2}}{(x-2)!}} + \sum_{x=1}^{\infty}{\frac{\lambda^{x-1}}{(x-1)!}} \right)\\
  &= \lambda e^{-\lambda} \left(\lambda \sum_{i=0}^{\infty}{\frac{\lambda^i}{i!}} + \sum_{j=0}^{\infty}{ \frac{\lambda^j}{j!} } \right) \\
  &= \lambda e^{-\lambda} (\lambda e^\lambda + e^\lambda) \\
  &= \lambda^2 + \lambda
\end{aligned}
$$`
