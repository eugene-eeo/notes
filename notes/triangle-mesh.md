---
title: triangle meshes
---

**Problem:** given a mesh of triangles represented as a collection of
vertices, find an efficient way to return the triangle that bounds any
given point P.

## Solution

Assume that the mesh is given in 2D. The solution can be extended to
arbitrary dimensions. First allocate a quadtree with dimensions equal
to the bounding box of the mesh. The bounding-box for any polygon `$ P $`
is simply a rectangle from the mininimum to maximum of each component:

`$$
\begin{aligned}
\text{bounding-box}(P) = &\min(P_x) \leq x \leq \max(P_x), \\
                         &\min(P_y) \leq y \leq \max(P_y)
\end{aligned}
$$`

The procedure to determine whether to partition any given region `$ R $`
into 4 sub-regions of equal size is as follows:

```
def to_split(R):
    return R.depth < d and \
           R.triangles_in_region > q
```

The two parameters, `$ q $` and `$ d $` determine the size of the quadtree
and it's tendency to be partitioned into subregions. A high `$ q $` will
tend to give a quadtree of low depth since splits occur less often, but
will impose a slower lookup because at most `$ q $` polygons need to be
tested.

A higher `$ d $` will yield better (in theory) performance as the
'granularity' of the smallest region will be higher, meaning fewer
polygons may need to be tested –

`$$
\text{granularity}(d) = \frac{\max(P_x) - \min(P_x)}{2^d}
$$`

in the x-dimension and similar for the y-dimension, but will give a higher
memory cost in the worst case for a very 'detailed' mesh, i.e. one with
a lot of very small triangles.

To get the bounding triangle of a point, given the quadtree-ified mesh:

```
def bounding_triangle(tree, point):
    node = tree.node_bounding_point(point)
    for triangle in node.triangles:
        if triangle.bounds(point):
            return triangle
    return None
```

A very rough estimate for the running time is `$ O(\log n) $` where `$ n $`
is the size of the mesh, because quadtree lookups are `$ \log n $`, but
practical implementations depend on the factors `$ q $` and `$ d $`.
