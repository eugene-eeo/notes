---
title: Root Mean Squared Error
---

Given two sequences `$ x_1 \ldots x_n $` and `$ y_1 \ldots y_n $`,
(usually one is predicted results using some model and the other
is the 'real' results,) the Root Mean Squared Error (RMSE) between
them is given by:

`$$
\sqrt{\frac{(x_1 - y_1)^2 + (x_2 - y_2)^2 + \ldots + (x_n - y_n)^2}{n}}
$$`

Larger RMSE means more errors. However very small losses in the RMSE
can mean large gains in accuracy of the model. Logic behind it:
assume that our model constantly predicts results with `$ \pm \epsilon $`
of error:

`$$
y_i = f(x_i) = x_i \pm \epsilon
$$`

Then the RMSE is:

`$$
\sqrt{\frac{\epsilon^2 + \epsilon^2 + \ldots}{n}} = \sqrt{\epsilon^2} = \epsilon
$$`

Then if we improve the model by decreasing the error by some amount
`$ \delta \epsilon $`, the RMSE decreases by the same amount. It is
exponentially harder to achieve more and more accurate results.

**Intuition:** In a dataset of `$ N $` rows where there are at most
`$ k $` meaningful rows, our probabilistic model selects `$ n $` rows
with a uniform distribution. Then take `$ p = \frac{k}{N} $` to be the
probability of a rows (datum) being meaningful. Then the probability
of getting `$ r $` meaningful data follows binomial distribution:

`$$
R \sim \text{B}(n, p)
$$`

Which for large values of `$ n $` and small values of `$ p $` can
be approximated by the Poisson distribution with `$ \lambda = np $`:

`$$
R \sim \text{P}_\text{o}(\lambda)
$$`

Then we can see that getting more and more accurate results (by
processing meaningful rows) in a large population `$ N $`, where
`$ n $` is bounded by computing power and time is exponentially
harder:

`$$
\text{F}(r) \approx 1 - \sum_{i=0}^r{\Pr(R=i)}
$$`
