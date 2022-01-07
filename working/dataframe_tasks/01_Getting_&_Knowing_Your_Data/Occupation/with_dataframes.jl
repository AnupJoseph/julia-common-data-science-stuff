# Step 1. Import the necessary libraries
using CSV
using DataFrames
using Pipe
using Statistics
using StatsBase

# Step 2. Import the dataset from this [address](https://raw.githubusercontent.com/justmarkham/DAT8/master/data/u.user).
URL = "https://raw.githubusercontent.com/justmarkham/DAT8/master/data/u.user"
download(URL, "user.dsv")

# Step 3. Assign it to a variable called users and use the 'user_id' as index
users = CSV.read("user.dsv", DataFrame, delim = "|")
users
# Indices don't really exist in Julia DataFrames

# Step 4. See the first 25 entries
first(users, 25)

# Step 5. See the last 10 entries
last(users, 10)

# Step 6. What is the number of observations in the dataset?
nrow(users)

# Step 7. What is the number of columns in the dataset?
size(users)[1]

# Step 8. Print the name of all the columns.
names(users)

# Step 10. What is the data type of each column?
eltype.(eachcol(users))

# Step 11. Print only the occupation column
users[!, :occupation]

# Step 12. How many different occupations are in this dataset?
size(unique(users[!, :occupation]))

# Step 13. What is the most frequent occupation?
value_counts(dataframe, column) = sort!(collect(countmap(dataframe[!, column])), by = x -> x[2], rev = true)
value_counts(users,"occupation")

# Step 14. Summarize the DataFrame.
describe(users)

# Step 16. Summarize only the occupation column
describe(users.occupation)

# Step 17. What is the mean age of users?
mean(users[:age])

# Step 18. What is the age with least occurrence?
value_counts(users,"age")[-1]