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
      // handle error here
   }
   b := buffer[:length]
   // do something with b, which is now appropriately sliced
   // but slicing it would not allocate another buffer, just
   // a slice header. if we want to go one step further use:
   //
   // b := buffer
   // if length != BLOCK_SIZE {
   //     b = buffer[:length]
   // }
   //
}
```
