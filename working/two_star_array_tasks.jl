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
Z = rand(0:0.01:100, 20)
make_int(x) = trunc(Int, x)
make_int.(Z)
# Now the question says 4 ways but Julia has a nice standard way of dealing with this so I am sticking to it

# Create a 5x5 matrix with row values ranging from 0 to 4 
A = fill([0:4;], 5)
# This is the solution if you want a array of arrays

# The solution for this particular problem
A = [0 1 2 3 4]
repeat(A, 5)


# This is a more generic solution but slightly more involved
repeat(reshape([0:4;], 1, :), 5)
# Lets break down as so 
# * [0:4;] creates a vector [0,1,2,3,4]
# * reshape([0:4;], 1, :) converts to 1x5 row vector from the column vector
# * The repeat function basically copies it five times

