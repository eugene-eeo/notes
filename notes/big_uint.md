---
title: big unsigned integers #justJSthings
---

```js
function big_uint(x) {
   return (x + '').replace(/^0+/, '');
}

function leftPadZeros(x, zeroCount) {
   for (var i = (zeroCount - x.length); i--;) {
      x = "0" + x;
   }
   return x;
}

big_uint.cmp = function(x, y) {
   var max = Math.max(x.length, y.length);
   var lhs = leftPadZeros(x, max);
   var rhs = leftPadZeros(y, max);

   if (lhs < rhs)   return -1;
   if (lhs === rhs) return 0;
   return 1;
};

big_uint.lt = function(x,y) { return big_uint.cmp(x, y) == -1; };
big_uint.eq = function(x,y) { return big_uint.cmp(x, y) == 0; };
big_uint.gt = function(x,y) { return big_uint.cmp(x, y) == 1; };
```
