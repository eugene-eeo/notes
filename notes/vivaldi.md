---
title: Vivaldi Coordinates
---

**Aim:** to provide a simple internet coordinate system to help predict
the RTT between nodes without direct measurement/communication. Vivaldi
attempts to reduce the global squared-error function of the coordinates:

`$$
E = \sum_i{\sum_j{(L_{ij} - || x_i - x_j ||)^2}},
$$`

where `$ || x_i - x_j || $` is the distance between coordinates of node
`$ i $` and `$ j $` in some coordinate space (Vivaldi is using a 2D +
height vector). Claim: using a system of physical springs, the force
between nodes `$ i $` and `$ j $` is given by:

`$$
F_{ij} = (L_{ij} - || x_i - x_j ||) \times u(x_i - x_j),
$$`

where the `$ L_{ij} - \ldots $` term is the displacement of the spring
from rest, and `$ u(x_i - x_j) $` is a unit vector in the direction of
`$ x_i - x_j $`. To do global (where coordinates and exact latencies to
all other nodes are known) error/force minimisation for some node `$ i $`
we need to shift the position of the node by a small amount, `$ \delta $`
in the direction of the resultant force:

`$$
x_i = x_i + \delta \sum_{j \neq i}{F_{ij}}
$$`

A simple way to do this without global knowledge is to simulate the
spring system locally on the node. To do this we only need the measured
`$ rtt $` (time for sending the signal + receiving an ack) between
node `$ j $` and it's coordinates, `$ x_j $`.

`$$
x_i = x_i + \delta (rtt - || x_i - x_j ||) \times u(x_i - x_j)
$$`

However such a system would allow for too much fluctuation in the
coordinates of the 'older, wiser' nodes once many new nodes enter the
system. So an adaptive `$ \delta $` is needed:

`$$
\delta \propto \frac{\text{local error}}{\text{local error} + \text{remote error}}
$$`

and the local error of a node, `$ e_i $` needs to be tracked. The new
algorithm, given some measurement `$ rtt $`, `$ x_j $` and some error
estimate `$ e_j $` of a remote node is again:

`$$
\begin{aligned}
     w &= \frac{e_i}{e_i + e_j} \\
   e_s &= \frac{| ||x_i - x_j|| - rtt |}{rtt} \\
   e_i &= e_i + w \times c_e(e_s - e_i) \\
\delta &= c_c \times w \\
   x_i &= x_i + \delta (rtt - ||x_i - x_j||) \times u(x_i - x_j)
\end{aligned}
$$`

Where `$ c_e $` and `$ c_c $` are constants. Vivaldi is defined for any
coordinate system that supports the vector subtraction, scalar distance,
and scalar multiplication operations. The height vector model where a 2D
coordinate `$ x $` comes with a scalar height `$ x_h $` is favoured:

`$$
\begin{aligned}
[x, x_h] - [y, y_h] &= [(x - y), x_h + y_h] \\
     || [x, x_h] || &= || x || + x_h \\
  k \times [x, x_h] &= [kx, kx_h]
\end{aligned}
$$`
