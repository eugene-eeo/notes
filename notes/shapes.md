---
title: Some Shapes
---

Area of any regular shape made of isoceles triangles, which the identical
lengths is `$ r $` and which the 'unique' angle is `$ \theta $` (e.g.
square `$ \theta = \frac{\pi}{2} $`).

`$$
\text{area} = \frac{2\pi}{\theta} \cdot \frac{1}{2} r^2 \sin\theta
$$`

To get an expression directly for regular shapes of `$ n $` sides:

`$$
\text{area} = \frac{n r^2}{2} \sin(\frac{2 \pi}{n})
$$`

Circle is a special limiting case:

`$$
\begin{aligned}
\text{area} &= \lim_{\theta \to 0}{\frac{\pi}{\theta} \cdot r^2 \sin\theta} \\
            &= \pi r^2 \lim_{\theta \to 0} \frac{\sin \theta}{\theta} \\
            &= \pi r^2
\end{aligned}
$$`
