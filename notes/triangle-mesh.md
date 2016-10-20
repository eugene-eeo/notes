---
title: triangle meshes
---

**Problem:** given a list of triangles in a 2D mesh, where each of the
vertices is known, find the triangle that bounds the given point in an
efficient manner (i.e. not scanning through all triangles and testing).
See: [reddit](https://www.reddit.com/r/algorithms/comments/58coqb/from_mesh_of_triangles_efficiently_find_the/).

## Solution

<img src="https://www.cs.cmu.edu/~quake/spiral.ele.a.2.gif" style="float: left; margin: 1em 1em 1em 0" width="30%" />

**Intuition:** need to find the 2 vertices that the point is bound in.
We can store a list of **X**, **Y**, ... components of the vertices
and then do a binary search on the arrays. This will give us pairs of
coordinates which "surrounds" the point in `$ O(\log n) $` time.

> **Difficulty:** we will get 2 vertices in each dimension. Then we
> need to find a way to efficiently associate each triangle with the
> pairs of vertices.
>
> **Solution:** associate each component of the vertice with the
> triangle it is from. Then take the intersection across each of the
> sets of triangles.

**Implementation:**

```
function initialise(triangles)
    let X := Mapping of floats to set of triangles
    let Y := Mapping of floats to set of triangles
    foreach ∆ of triangles:
        foreach vertex of ∆:
            X[vertex.X].add(∆)
            X[vertex.Y].add(∆)
        end
    end
    return X, Y
end

# takes the X, Y from the return value of initialise
function which-triangle?(X, Y, point)
    let x0, x1 := binary-search(X, point.X)
    let y0, y1 := binary-search(Y, point.Y)
    let triangles := intersection(X[x0], X[x1], Y[y0], Y[y1])
    foreach ∆ of triangles:
        if point-in-triangle?(point, ∆):
            return ∆
        end
    end
    # wtf, should not be reached!
end
```

**Evaluation:** the solution requires `$ O(n) $` space and runs in
`$ O(\log n) $` time. In the best case where a boundary side is chosen,
an optimisation can be made that the algorithm can return said triangle
immediately. In the worse case it needs to check two triangles for whether
they bound the given point. Assumptions:

> **A1:** Every side in the mesh can only be shared by at most 2 triangles.
>
> **A2:** Testing for whether a triangle bounds a point can be done in
> `$ O(1) $` time, i.e. the `point-in-triangle?` function runs in
> `$ O(1) $`.
