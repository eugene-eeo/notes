---
title: p2pns
---

**P2PNS** – an outline of the design of a peer to peer name service
suitable for use within small network meshes. P2PNS is completely
decentralised and requires no central authority to give out names.
A name service can be described as a key-value store, and the problem
can be simplified to how to store key-value pairs without allowing
arbitrary modifications.

A very simple solution to this problem is to require a proof-of-work
before modification. All servers will maintain a mapping of names
to IP-addresses and high-score counters, for instance:

| domain  | IP-address     | high-score |
|---------|----------------|------------|
| john    | 117.xxx.xxx.xx | 2          |
| don     | 176.xxx.xxx.xx | 4          |

More formally, each entry (IP-address and high-score) can be expressed
like so:

`$$
\text{Pair}(\text{address}, \text{high score}) \Rightarrow P(a, c)
$$`

A client that wants to change the domain of `john` to another IP-address
will now have to send the change request along with a value, that when
hashed will give a higher number of leading zeroes than the current
high score (2). A request can be expressed like so:

`$$
\text{Request}(\text{domain}, \text{address}, \text{value}) \Rightarrow R(d, a, v)
$$`

The algorithm for updating the mapping, given a request ``R`` is the
following:

```
def update(mapping, R):
    c = leading_zeroes(hash(R.v))
    if c > mapping[R.d].c:
        mapping[R.d] = P(R.a, c)
```

So far we have only covered *registration*. A name service needs to have
*querying* capabilities, so we need to define a way for the nodes that
run the name service to replicate their state. One very simple approach
is to define a merge operation for two mappings:

```
def merge_pair(p1, p2):
    if p1.c > p2.c: return p1
    if p1.c < p2.c: return p2
    return Pair(union(p1.a, p2.a), p1.c)

def merge_mapping(m1, m2):
    merged = {}
    for key in union(m1, m2):
        merged[key] = merge_pair(m1[key], m2[key])
    return merged
```

Servers can simply replicate by communicating their mappings to other
nodes, which can then synchronise states by running the merge algorithm.
Because it is idempotent, associative, and commutative nodes can merge
without fear of any data loss due to ordering differences. One problem
arises:

> **Two domains may share multiple addresses that have the same high
> scores.** In this implementation we choose to take the union over
> the addresses, but an optimisation is to have a periodic GC task
> that arbitrarily (but deterministically) selects one IP-address
> from the set, and delete the others to save space.

A challenge is to generalise the same solution to multi-hashes. A multi
hash high score can be represented using a mapping, like the following:

| algorithm | high-score    |
|-----------|---------------|
| SHA512    | 5             |
| SHA256    | 3             |
| SHA2      | 2             |
| MD5       | 1             |

Then we can say that the following is the same as the above mapping, but
in more fancy vector form.

`$$
H = \langle 5, 3, 2, 1 \rangle
$$`

For the merge algorithm we need to define a partial ordering relationship
between any two high-score vectors (of course, from the same basis, i.e. `SHA512`,
`SHA256`, ... `MD5` in this case). An intuitive solution is to use a cost
function for each of the components. Then we can write, for any high-score
vector `$ H = \langle H_1, H_2, \ldots H_N \rangle $`:

`$$
\text{cost}(H) = \sum_{i=1}^{N}{F_i(H_i)}
$$`

Where `$ F_i $` is the cost function for the `$ i $`-th component according
to some cost function vector/matrix. For instance, if we have the following
weights:

`$$
F = \langle
   2x^2 + 2x + 10,
    x^2 +  x + 5,
    0.5x^2,
    x
\rangle
$$`

Then `$ \text{cost}(H) $` would evaluate to `$ F_1(5) + F_2(3) + F_3(2) + F_4(1) = 90 $`.
Of course the 'real life' cost function vector would be exponential, and
will be empirically determined. Then to actually merge two pairs, we
need to take the maximum of each component of each high-score vector
and then take the union of the addresses. For instance:

`$$
\text{merge}(
   P(1, \langle 1, 2 \rangle),
   P(2, \langle 100, 0 \rangle)) = P(2, \langle 100, 2 \rangle)
$$`

Then the update operation is defined such that an update is only accepted
iff at least one of the components is larger than the one in the current
high-score vector, and all other components are at least as large as the
ones in the current high score vector.

```
# returns true if vec1 > vec2
def larger_than(vec1, vec2):
    has_larger = False
    for a, b in zip(vec1, vec2):
        if a > b:
            has_larger = True
        elif a < b:
            return False
    return has_larger
```

So the new, generalised update mechanism is:

```
def update(mapping, R):
    c = highscore_vector_from_values(R.v)
    if larger_than(c, mapping[R.d].c):
        mapping[R.d] = P(R.a, c)
```
