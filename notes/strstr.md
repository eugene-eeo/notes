---
title: StrStr algorithm
---

```python
import string


# creates a 'skip-hash': how many characters
# to skip by when you encounter a particular
# character.
def preprocess(pattern):
    T = {}
    length = len(pattern)
    for i in string.ascii_lowercase:
        T[i] = length

    for i in range(0, length - 1):
        T[pattern[i]] = length - 1 - i
    return T


def search(needle, haystack):
    T  = preprocess(needle)
    lh = len(haystack)
    ln = len(needle)
    skip = 0

    # if this is false then the remainding
    # string cannot contain the needle
    while lh - skip >= ln:
        i = ln - 1
        # while the strings from the haystack
        # matches the needle (starts backwards)
        while haystack[skip+i] == needle[i]:
            if i == 0:
                return skip
            i = i - 1
        # skip by some amount given by the last
        # character: e.g. search for 'abc' in 'defabc'
        # skips by T['f'] == 3, so the next time
        # we start at 'c'
        skip = skip + T[haystack[skip + ln - 1]]
    return -1
```
