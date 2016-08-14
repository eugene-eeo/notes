---
title: floating point
---

Basically standard form but in base 2. Current standard for floating point
representation is IEEE-754. All finite numbers can be written as:

`$$
(-1)^s \times c \times b^q
$$`

where:

 - `$ b $` – base
 - `$ s $` – sign (0/1)
 - `$ c $` – significand of precision `$ p $`, integer `$ 0 \leq c \leq b^p - 1 $`
 - `$ q $` – exponent, (signed) integer `$ 1 - \text{emax} \leq q + p - 1 \leq \text{emax} $`

Explanation for choice of `$ q $`:

`$$
\begin{aligned}
(b^p - 1) \times b^{\text{emax} - (p-1)} &= b^{\text{emax} - 1} - b^{\text{emax} - (p-1)} \\
   &= (b - b^{-p+1}) \times b^{\text{emax}}
\end{aligned}
$$`

Also when `$ p = 1 $`, `$ 1 - \text{emax} \leq q \leq \text{emax} $`. N-bit
floating point number, with precision of `$ p $`:

|   s   |    c   |     q      |
|:-----:|:------:|:----------:|
| 1 bit | p-bits | N-p-1 bits |
