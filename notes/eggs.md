---
title: Eggs and Floors Problem
---

A generalisation of the eggs and floors problem is the following:
given `$ e $` eggs and `$ f $` floors, find the minimum number of
egg drops in the worse case to determine the floor that the egg
breaks. We can assume that the egg does not break or get damaged
(and as such can be re-used indefinitely) as long as the floor
it is dropped on `$ \lt f_{\text{breaking}} $`.

Let `$ W(e,f) $` be the minimum number of egg drops we need to
perform, in the worse case given some `$ e $` and some `$ f $`.
It follows simply that:

`$$
W(1, f) = f
$$`

Because if we only have one egg, there is no alternative but to drop
it from every floor, starting from the bottom. Combining the knowledge
above and eliminating some obvious cases, we have:

`$$
W(e, f) = \begin{cases}
      0 & \text{if}\, f = 0,\\
      1 & \text{if}\, f = 1,\\
      f & \text{if}\, e = 1,\\
F(e, f) & \text{otherwise.}
\end{cases}
$$`

To find `$ F(e, f) $`, consider a simple strategy to test for the
egg-breaking floor, given two eggs. (It can be generalised to more
eggs, but the idea is the same):

1. Pick some floor `$ x $`. Drop an egg from `$ x $`.
2. If the egg breaks then `$ f_{\text{breaking}} \leq x $`; we
   need to do a linear search on the floors below `$ x $` with
   one egg.
3. Else, we can repeat the two-egg procedure but for the floors
   above `$ x $`.

Naturally we would want to find the `$ x $` that minimises the number
of drops we need to do. Intuitively this should be the 'middle' floor
as it eliminates more than half of the floors. If we have more eggs,
we can eliminate more floors. A formalised version of the above
strategy for any `$ x $`:

`$$
F(e, f) = 1 + \min_{x \in [1,f]} \{ {\max(W(e-1, x-1), W(e, f-x))} \}
$$`

What `$ F(e,f) $` does is that it finds the optimal value for
the floor `$ x $` such that the total number of egg drops after
the initial drop is minimised:

 - `$ W(e-1, x) $` – the egg broke, so we need to search the
 floors below `$ x $`.
 - `$ W(e, f-x) $` – search the floors above `$ x $` with the
 same number of eggs. Notice in both cases the floor `$ x $` is
 *not* searched again.

The Python program to compute the minimum number of eggs to drop
in the worse case, to determine the floor which is high enough
to break the eggs:

```
def W(e, f):
    if f == 0: return 0
    if f == 1: return 1
    if e == 1: return f
    return 1 + min(
        max(W(e-1, x), W(e, f-x)) for x in range(1, f+1)
    )
```

<img src="https://i.imgur.com/hSvBJwA.png" width='100%'/>
