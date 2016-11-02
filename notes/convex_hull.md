---
title: convex hull proofs
---

**0:** Prove that the intersection of two convex sets is again convex.

> Let `$ C_1, C_2 $` be some convex sets containing `$ S $`. For all points
> `$ p, q \in S $`, where `$ p \neq q $`, `$ \overline{pq} \in C_1, C_2 $`.
> therefore `$ \overline{pq} \in C_1 \cap C_2 $`, and thus `$ C_1 \cap C_2 $`
> is again convex.


**1:** Let `$ S $` be a set of `$ n $` line segments in the plane. Prove that the convex
hull of `$ S $` is the same as the convex hull of the `$ 2n $` endpoints of the segments.

> Any line segment in `$ S $` can be written as `$ \overline{pq} $`. From the definition
> of `$ \mathcal{CH}(S) $`:
>
> `$$ \overline{pq} \in \mathcal{CH}(S) $$`
>
> Therefore by the decomposing the line segments:
>
> `$$ \mathcal{CH}(S) = \mathcal{CH}(\{ p, q, \ldots \}) $$`


**2:** Let `$ P $` be a set of points in the plane. Let `$ \mathcal{P} $` be the convex
polygon whose vertices are points from `$ P $` and that contains all points in `$ P $`.
Prove that this polygon `$ \mathcal{P} $` is uniquely defined, and that it is the
intersection of all convex sets containing `$ P $`.

> `$ \mathcal{P} $` must contain every point in `$ P $`, and must only be defined by
> points within `$ P $`. Therefore it must be `$ \mathcal{CH}(P) $`. The convex hull of
> `$ P $` is defined to be the intersection of all convex sets including `$ P $`,
> completing the proof for the second part.
>
> Assume that there is an alternative configuration `$ \mathcal{P}' $`,
> `$ \mathcal{P} \neq \mathcal{P}' $`. `$ \mathcal{P}' $` *must* either contain one
> of the non-boundary vertices of `$ P $`, or one of the vertices in `$ \mathcal{P} $`
> is not within `$ \mathcal{P}' $`. Therefore it does not contain all points in `$ P $`,
> and thus `$ \mathcal{P} $` is uniquely defined.
