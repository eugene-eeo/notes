---
title: crc
---

```python
# msg: [int...]
# div: [int...]
def crc(msg, div):
    padding = [0] * div.count(1)
    msg = msg + padding

    for i in range(len(msg) - len(padding)):
        if msg[i] == 1:
            for j, bit in enumerate(div):
                msg[i+j] ^= bit

    return msg[-len(padding):]
```
