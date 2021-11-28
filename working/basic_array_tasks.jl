using LinearAlgebra
using Statistics

# 3. Create a null vector of size 10

Z = zeros(Int8, 10)
Z

# 4. How to find the memory size of any array
Z = zeros(Int8, 10, 10)
Z

size_bytes(x) = Base.format_bytes(Base.summarysize(x))
size_bytes(Z)

# How to get the documentation of the numpy add function from the command line?
? +

# ? zero

# Create a null vector of size 10 but the fifth value which is 1
Z = zeros(Int8, 10)
Z[5] = 1
Z

# Create a vector with values ranging from 10 to 49
Z = [10:50]
Z
# If you actually want it as an array for some reason 
Z = [10:50;]
Z

# Reverse a vector (first element becomes last)
Z = zeros(Int8, 10)
reverse!(Z)
Z

# Create a 3x3 matrix with values ranging from 0 to 8
Z = [0:8;]
Z = reshape(Z, (3, 3))

# This is likely a more efficient method
Z = reshape(Vector(0:8), (3, 3))

# Find indices of non-zero elements from [1,2,0,0,4,0]
Z = [1, 2, 0, 0, 4, 0]
print(findall(iszero, Z))
Z[findall(iszero, Z)]

# Create a 3x3 identity matrix
Z = Matrix{Int}(I, 3, 3)

# Create a 3x3x3 array with random values
Z = rand(Int, (3, 3, 3))
Z

# Create a 10x10 array with random values and find the minimum and maximum values
Z = rand(Int, (10, 10))
minimum(Z)
maximum(Z)

# Create a random vector of size 30 and find the mean value
Z = Vector(rand(Int, 10))
sum(Z) / length(Z)

# Create a 2d array with 1 on the border and 0 inside
Z = ones(10, 10)
Z[2:end-1, 2:end-1] .= 0
Z

# Okay there are a few bits here that we have to address:
# Right of the bat Julia uses 1-based indexing as you probably already know
# The end keyword represents the end of a dimension in Julia, It provides a more explicit way to specify indexes.
# Finally the . operator is used for broadcasting. Julia does not automatically write 0 everywhere if you use just the assignment operator. This can often trip people and instead the . operator provides an explicit broadcasting method

# How to add a border (filled with 0's) around an existing array?
len_mat = 9
Z = ones(Int8, len_mat, len_mat)
borderZ = zeros(Int8, len_mat + 2, len_mat + 2)
borderZ[2:end-1, 2:end-1] = Z
borderZ
# Ok so this is very much an extremely hacky way to do this but I couldn't find a good way to go about this.
# If you are using this in a context of images processing then Image Filtering has a way described here https://discourse.julialang.org/t/is-there-any-padding-function-available-to-pad-a-matrix-or-array/8521/3
# PaddedViews.jl might be an option too if you are using this a lot


# Create a 5x5 matrix with values 1,2,3,4 just below the diagonal 
diagonal = [1, 2, 3, 4]
ld = Bidiagonal(zeros(5), diagonal, :L)
# : in this context is an identifier essentially used to identify an entity. Here if you use :U instead, that uses a different implementation which would place the diagonal vector on top of zeros instead


# Consider a (6,7,8) shape array, what is the index (x,y,z) of the 100th element?
arr = rand(Int8, (6, 7, 8))
c_x = CartesianIndices(arr)
arr[c_x[100]]

# Create a checkerboard 8x8 matrix using the tile function
base_mat = [[1, 0], [0, 1]]
repeat(base_mat,4,4)