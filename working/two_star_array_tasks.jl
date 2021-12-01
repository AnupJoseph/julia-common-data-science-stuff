using LinearAlgebra
using Statistics
using Dates

# How to get all the dates corresponding to the month of July 2016?
dr = Date("2016-07-01"):Day(1):Date("2016-07-31")

# The above is probably all you need but if if do need to get the dates individually then this works
dr = [Date("2016-07-01"):Day(1):Date("2016-07-31");]

# How to compute ((A+B)*(-A/2)) in place (without copy)?
A = ones(3)
B = 2ones(3)

(A + B) .* (-A / 2)


# Extract the integer part of a random array of positive numbers?
Z = rand(0:0.01:100,20)
make_int(x) = trunc(Int,x)
make_int.(Z)
# Now the question says 4 ways but Julia has a nice standard way of dealing with this so I am sticking to it