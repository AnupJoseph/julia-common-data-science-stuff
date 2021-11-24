using LinearAlgebra

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