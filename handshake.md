---
title: Key Exchange (Handshake)
---

Used in SSH and TLS. Maintains security against passive (eavesdropping)
adversaries. The aim is to agree upon a shared key `$ k $` for encrypting
and decrypting messages without sending it over the network.

 1. Two people, **A** and **B** want to communicate. Eavesdropper
 **C** wants to eavesdrop on the data sent.
 2. **A** and **B** choose two secrets `$ S_A $` and `$ S_B $`.
 3. All participants know a commutative, associative and one-way
 operation `$ \circ $` and an initial value `$ \sigma $` (usually
 protocol-specific).
  - **A** sends `$ S_A \circ \sigma $` to **B**.
  - **B** sends `$ S_B \circ \sigma $` to **A**.
 4. Now **A** and **B** mix in their own secrets:
  - **A** calculates `$ k = S_A \circ (S_B \circ \sigma) $`
  - **B** calculates `$ k = S_B \circ (S_A \circ \sigma) $`
 5. **C** only knows `$ \sigma $`, `$ F_A $`, and `$ F_B $` and there
 is no way to know `$ S_A $` and `$ S_B $` given a strong enough `$ f $`.
 **C** also cannot reconstruct `$ k $`.
