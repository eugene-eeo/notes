---
title: Proportional Integral Derviative
---

PID is a feedback mechanism that can be used to try and apply correction
based on the `$ K_p, K_i, K_d $` coefficients (for the proportional,
integral, and deriviative terms respectively) to try and minimise an
error term, `$ e(t) $` which is defined to be:

`$$
e(t) = \text{desired} - \text{measured}
$$`

The controller attempts to adjust the output of a control variable
(e.g. the change in the voltage given to a heating coil) `$ u(t) $`
to reduce the error over time.

`$$
u(t) = K_p e(t) + K_i \int^{t}_{0}{e(\tau)}d\tau + K_d \frac{de(t)}{dt}
$$`

 - `$ K_p e(t) $` – accounts for the current error; what the controller
 should do immediately given some error value.
 - `$ K_i \int{e(\tau)}d\tau$` – accounts for past values of the error,
 the intuition being that the controller does more corrective action
 as the error builds up over time.
 - `$ K_d \frac{d}{dt}e(t) $` – a prediction of the trend of the error.

In discrete time systems:

`$$
u(t) = K_p e(t) + K_i \sum^{t}_{\tau=0}{e(\tau) \delta t} + K_d \frac{e(t) - e(t - \delta t)}{\delta t}
$$`

Where `$ \delta t $` is the sampling interval/timestep. The process
variable, (e.g. the actual value of the voltage given to a heating
coil) `$ PV(t) $` is usually defined in discrete time systems as:

`$$
PV(t+\delta t) = PV(t) + u(t)
$$`
