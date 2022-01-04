# Step 1. Import the necessary libraries
using CSV
using DataFrames
using Pipe
using Statistics

# Step 2. Import the dataset from this (https://raw.githubusercontent.com/justmarkham/DAT8/master/data/chipotle.tsv).
URL = "https://raw.githubusercontent.com/justmarkham/DAT8/master/data/chipotle.tsv"
download(URL, "chipotle.tsv")

# Step 3. Assign it to a variable called chipo.
chipo = CSV.read("chipotle.tsv", DataFrame, delim = "\t", missingstring = missing)

# Step 4. See the first 10 entries
first(chipo, 10)

# Step 5. What is the number of observations in the dataset?
nrow(chipo)

# Step 6. What is the number of columns in the dataset?
ncol(chipo)

# Step 7. Print the name of all the columns.
names(chipo)

# Step 9. Which was the most-ordered item?
chipo_groupby = @pipe chipo |> groupby(_, :item_name) |> combine(_, :quantity => sum => :total_quantity)

sort(chipo_groupby, :total_quantity, rev = true)

replace!(chipo[:choice_description], "" => missing)

# Step 11. What was the most ordered item in the choice_description column?
choice_description_groupby = @pipe chipo |> groupby(_, :choice_description) |> combine(_, :quantity => sum => :total_quantity)

sort(choice_description_groupby, :total_quantity, rev = true)

# Step 12. How many items were orderd in total?
sum(chipo[:quantity])

# Step 13. Turn the item price into a float
transform!(chipo, :item_price => ByRow(x -> parse(Float64, x[2:end])) => :item_price)

# Step 14. How much was the revenue for the period in the dataset?
sum(chipo.quantity .* chipo.item_price)

# Step 15. How many orders were made in the period?
order_counts = nrow(combine(groupby(chipo, :order_id), nrow => :count_per_order))

# Step 16. What is the average revenue amount per order?
