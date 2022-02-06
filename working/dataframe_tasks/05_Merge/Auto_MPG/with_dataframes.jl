# Imports
using DataFrames
using CSV
using Pipe

# Step 2. Import the first dataset [cars1](https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/05_Merge/Auto_MPG/cars1.csv) and [cars2](https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/05_Merge/Auto_MPG/cars2.csv).
download("https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/05_Merge/Auto_MPG/cars1.csv", "cars1.csv")
download("https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/05_Merge/Auto_MPG/cars2.csv", "cars2.csv")

# Step 3. Assign each to a to a variable called cars1 and cars2
cars1 = CSV.read("cars1.csv", DataFrame)
cars2 = CSV.read("cars2.csv", DataFrame)

show(cars1, allcols = true)
show(cars2, allcols = true)

# Step 4. Oops, it seems our first dataset has some unnamed blank columns, fix cars1
cars1[!, Between(:mpg, :car)]

# This syntax works as well if you want from the beginand don't know the column name for some reason
cars1 = cars1[!, Between(begin, :car)]

# Step 5. What is the number of observations in each dataset?
size(cars1)
size(cars2)

# Step 6. Join cars1 and cars2 into a single DataFrame called cars
append!(cars1, cars2)

# Step 7. Oops, there is a column missing, called owners. Create a random number Series from 15,000 to 73,000.
owners = [ceil(i) for i in range(15000, 73000, length = 398)]

# Step 8. Add the column owners to cars
cars1.owners = owners
show(cars1,allcols=true)