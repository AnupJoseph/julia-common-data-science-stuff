using LinearAlgebra
using Statistics
using Dates
using Distances
using DelimitedFiles
using Distributions

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


# Create a vector of size 10 with values ranging from 0 to 1, both excluded
Z = [rand(Float64) for i in range(1:10)]
# Most of the time this will work. I don't really see the need to actually exclude 0 as well from this code but if you do, then
Z = [prevfloat(1.0) * (1 - rand()) for i in range(1:10)]
# Again its pretty extremely unlikely you'd actually need it but if you do, then you please read this discussion as well before going in https://discourse.julialang.org/t/how-to-create-a-random-uniform-distribution-between-but-excluding-0-and-10

# Create a random vector of size 10 and sort it
Z = rand(Int, 10)
sort!(Z)

# Consider two random array A and B, check if they are equal
A = rand(1:20, 10)
B = rand(1:20, 10)

# To check if the arrays are completely equal
A == B

# To check if the elements in the arrays are equal
A .== B

# Consider a random 10x2 matrix representing cartesian coordinates, convert them to polar coordinates
struct cartesian_point
    X::Float32
    Y::Float32
end

points = [cartesian_point(rand(), rand()) for _ = 1:10]
radians(x, y) = sqrt(x^2 + y^2)
theta(x, y) = atan(y, x)

Xpoints = [point.X for point in points]
Ypoints = [point.Y for point in points]

radians.(Xpoints, Ypoints)
theta.(Xpoints, Ypoints)
# Yes, I am over engineering this and doing a bad job at it at the same time. Struct is one of the very core ideas in Julia and I have been kind of skirting about it. A Dict or even an array of arrays would do just fine. I might refactor this later but I am sticking with this for the moment

# Create random vector of size 10 and replace the maximum value by 0
Z = rand(Int8, 10)
Z[argmax(Z)]

# Create a structured array with x and y coordinates covering the [0,1]x[0,1] area
Z = (X = collect(LinRange(0, 1, 5)), Y = collect(LinRange(0, 1, 5)))

# Given two arrays, X and Y, construct the Cauchy matrix C (Cᵢⱼ = 1 ÷ (xᵢ - yⱼ))
X = rand(Int8, 10)
Y = rand(Int8, 10)

C = [[(1 ÷ (i - j)) for i in X] for j in Y]
det(C)

f(i, j) = 1 ÷ (i - j)
C = (f(x, y) for x in X, y in Y)
det(collect(C))

# How to find the closest value (to a given scalar) in a vector?
A = rand(Int8, 10)

findnearest(A, x) = argmin(abs.(A .- x))
A[findnearest(A, 0)]

# Consider a random vector with shape (100,2) representing coordinates, find point by point distances
A = rand(Int8, (10, 2))
B = rand(Int8, (10, 2))
pairwise(Euclidean(), A, B, dims = 1)
# I am using the distances package here as it feels more Julian. 

# How to convert a float (32 bits) array into an integer (32 bits) in place
A = rand(Float32, 10)
trunc.(Int, A)

# How to read the following file?
"""
1, 2, 3, 4, 5
6,  ,  , 7, 8
 ,  , 9,10,11
"""
data = readdlm("num_fle.txt", ",")
data

# What is the equivalent of enumerate for Julia arrays?
# Enumerate is just enumerate in Julia
Z = [1:9;]
squared = [i^2 for (i, num) in enumerate(Z)]

# Generate a generic 2D Gaussian-like array
σ, μ = 1.0, 0.0
X, Y = LinRange(-1, 1, 100), LinRange(-1, 1, 100)
G(x, y, μ, σ) = exp(-(x - μ) .^ 2 / (2.0 * σ^2) - (y - μ) .^ 2 / (2.0 * σ^2))
mat = [G(x, y, μ, σ) for x in X, y in Y]

# How to randomly place p elements in a 2D array?
n, p = 10, 3
Z = zeros(Int8, n, n)
Z[rand(1:n*n, p)] .= 1
# So this is kind of a hack but I think its okay.

# Subtract the mean of each row of a matrix
Z = rand(1:100, 10, 10)
remove_mean(A) = A .- mean(A)
mapslices(remove_mean, Z, dims = 1)

# How to sort an array by the nth column?
Z = rand(1:100, 10, 10)
n = 3
sortslices(Z, dims = 1, by = x -> x[n])

# How to tell if a given 2D array has null columns?
# Julia allows a whole host of things to define what you specifically mean by null, Here I am going to choose that easy way out and pretend to use see zero instead, i.e. filter rows which are zero
Z = ones(10, 10)
Z[2] .= 0
filter(x -> any(!iszero, x), Z)

