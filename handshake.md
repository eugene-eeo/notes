---
title: Diffie Hellman Exchange
---

Used in SSH and TLS. Key-exchange algorithm that maintains security against
passive (eavesdropping) adversaries. High level overview:

 1. Two people, **A** and **B** want to communicate. Eavesdropper
 **C** wants to eavesdrop on the data sent.
 2. **A** and **B** choose two secrets `$ S_A $` and `$ S_B $`.
 3. Given a function `$ f $` that is commutative[^comm],
 associative[^assoc], and one-way[^one-way], and `$ \sigma $`,
 usually a protocol-specific shared value,
  - **A** sends `$ F_A = f(S_A, \sigma) $` to **B**.
  - **B** sends `$ F_B = f(S_B, \sigma) $` to **A**.
 4. Now **A** and **B** mix in their own secrets:
  - **A** calculates `$ k = f(F_B, S_A) $`
  - **B** calculates `$ k = f(F_A, S_B) $`
 5. This is the key- since `$ f $` is associative they will both end up
 with the same final value. This final value is not sent over the network
 and will be used to encrypt/decrypt messages sent between them.
 6. **C** only knows `$ \sigma $`, `$ F_A $`, and `$ F_B $` and there
 is no way to know `$ S_A $` and `$ S_B $` given a strong enough `$ f $`.
 **C** also cannot reconstruct `$ k $`.


[^comm]: Commutative property: `$ a \circ b = b \circ a $`
[^assoc]: `$ (a \circ b) \circ c = a \circ (b \circ c) $`
[^one-way]: Hard to reverse the computation.
