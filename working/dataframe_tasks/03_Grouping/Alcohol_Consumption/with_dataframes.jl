# Step 1. Import the necessary libraries
using DataFrames
using CSV
using Pipe
using Statistics

# Step 2. Import the dataset from this [address](https://raw.githubusercontent.com/justmarkham/DAT8/master/data/drinks.csv).
URL = "https://raw.githubusercontent.com/justmarkham/DAT8/master/data/drinks.csv"
download(URL, "drinks.csv")

# Step 3. Assign it to a variable called drinks.
drinks = CSV.read("drinks.csv", DataFrame)

# Step 4. Which continent drinks more beer on average?
continents = @pipe drinks |> groupby(_, :continent) |> combine(_, :beer_servings => mean)

# Step 5. For each continent print the statistics for wine consumption.
# Can't figure out a way now will get back to this at some point

# Step 6. Print the mean alcohol consumption per continent for every column
continents = @pipe drinks |> groupby(_, :continent) |> combine(_, valuecols(_)[2:end] .=> mean)
@pipe drinks |> groupby(_, :continent) |> combine(_, names(_, Number) .=> mean)


# Step 7. Print the median alcohol consumption per continent for every column
@pipe drinks |> groupby(_, :continent) |> combine(_, valuecols(_)[2:end] .=> median)
@pipe drinks |> groupby(_, :continent) |> combine(_, names(_, Number) .=> median)

# Step 8. Print the mean, min and max values for spirit consumption.
compute_mean_max_min(x) = mean(x), minimum(x), maximum(x)
@pipe drinks |> groupby(_, :continent) |> combine(_, :spirit_servings => compute_mean_max_min)