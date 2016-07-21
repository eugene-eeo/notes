---
title: Matrix inverse
---

Inverse of matrix `$ A $` is defined to be:

`$$
\begin{aligned}
A^{-1} &= \frac{\text{adj}(A)}{|A|} \\ \\
       &= \frac{1}{|A|}\begin{pmatrix}
A_{1,1} & A_{1,2} & \cdots & A_{1,n} \\
A_{2,1} & A_{2,2} & \cdots & A_{2,n} \\
\vdots  & \vdots  & \ddots & \vdots  \\
A_{n,1} & A_{n,2} & \cdots & A_{n,n}
       \end{pmatrix}^T \\ \\
       &= \frac{1}{|A|}\begin{pmatrix}
A_{1,1} & A_{2,1} & \cdots & A_{n,1} \\
A_{1,2} & A_{2,2} & \cdots & A_{n,2} \\
\vdots  & \vdots  & \ddots & \vdots  \\
A_{1,n} & A_{2,n} & \cdots & A_{n,n}
       \end{pmatrix}
\end{aligned}
$$`

Proof:

`$$
\begin{pmatrix}
A_{1,1} & A_{2,1} & \cdots & A_{n,1} \\
A_{1,2} & A_{2,2} & \cdots & A_{n,2} \\
\vdots  & \vdots  & \ddots & \vdots  \\
A_{1,n} & A_{2,n} & \cdots & A_{n,n}
       \end{pmatrix} A = |A| \times I^n
$$`
