# Step 1. Import the necessary libraries
using DataFrames
using CSV
using Pipe
using DataFramesMeta
using Dates
using Statistics

# Step 2. Import the dataset from this [address](https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/04_Apply/US_Crime_Rates/US_Crime_Rates_1960_2014.csv).
URL = "https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/04_Apply/US_Crime_Rates/US_Crime_Rates_1960_2014.csv"
download(URL, "US_Crime_Rates_1960_2014.csv")

# Step 3. Assign it to a variable called crime.
crime = CSV.read("US_Crime_Rates_1960_2014.csv", DataFrame)

# Step 4. What is the type of the columns?
eltype.(eachcol(crime))

# Step 5. Convert the type of the column Year to datetime64
crime.Year = DateTime.(crime.Year, DateFormat("d u Y  H:M "))

# Step 6. Set the Year column as the index of the dataframe
# This doesn't have much meaning in DataFrames.jl

# Step 7. Delete the Total column
select!(crime, Not(:Year))

# Step 8. Group the year by decades and sum the values
# Honestly can think of any good approach at the moment. will add something better later