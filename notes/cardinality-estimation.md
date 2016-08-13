---
title: Cardinality Estimation
---

**Cardinality – how many unique items in a sequence.** Normal approach
of putting (and remembering) items inside the set requires linear space,
not suitable for "big data".

A good estimation is to use the fact that good hash functions produce
bits which value are (almost) statistically independent from one another.
For instance we can put the hashes into 'buckets', depending on the
first two bits. All buckets start off initially with value of 0.

| `00` | `01` | `10` | `11` |
|:----:|:----:|:----:|:----:|
| 0    | 0    | 0    | 0    |


Each bucket will store the higest number of trailing zeroes. For instance
if we see the value `001001100`, we'll put it inside bucket `00` and then
update the counter to be 2. However if we see the value `001001110` we will
not update the counter because 1 is less than 2.

Then take a hash function `$ h $` and apply it to each of the values in
the sequence, `$ v_1, v_2, v_3, \ldots $` and then update the corresponding
buckets. e.g. given the following hashes:

 - `010010110`
 - `011010010`
 - `110011010`
 - `100011011`

We'll end up with the table:

| `00` | `01` | `10` | `11` |
|:----:|:----:|:----:|:----:|
| 0    | 1    | 0    | 1    |

The probability of getting `$ n $` zeroes at the end is `$ 2^{-n} $`,
assuming we have a good enough hash function. Note a very simple concept:
if something happens 1/8ths of the time we expect that if we repeat the
action 8 times at least 1 will be successful.

In the same way a (bad) estimate for the size of the set, given a counter
of values `$ c_1, c_2, c_3, \ldots $` will be given by:

`$$
2^{c_1} + 2^{c_2} + \ldots = \sum_{i=1}^{n}{2^{c_i}}
$$`

If we evaluate it for our table it gives 6. Which is wrong but the
estimate gets better as we increase the number of buckets (hence increase
the length of the prefix) and put more data inside it.
