---
title: single alloc read
---

```go
// r io.Reader
buffer := make([]byte, BLOCK_SIZE)
for {
   length, err := r.Read(buffer)
   if length == 0 {
      break
   }
   if err != nil && err != io.EOF {
      return nil, err
   }
   b := buffer[:length]
   // do something with b, which is now appropriately sliced
}
```
