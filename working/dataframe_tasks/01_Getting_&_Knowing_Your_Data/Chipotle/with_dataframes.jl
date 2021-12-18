# Step 1. Import the necessary libraries
using CSV
using DataFrames

# Step 2. Import the dataset from this (https://raw.githubusercontent.com/justmarkham/DAT8/master/data/chipotle.tsv).
URL = "https://raw.githubusercontent.com/justmarkham/DAT8/master/data/chipotle.tsv"
download(URL, "chipotle.tsv")

# Step 3. Assign it to a variable called chipo.
chipo = CSV.read("chipotle.tsv", DataFrame, delim = "\t")

# Step 4. See the first 10 entries
first(chipo, 10)

# Step 5. What is the number of observations in the dataset?
nrow(chipo)

# Step 6. What is the number of columns in the dataset?
ncol(chipo)

# Step 7. Print the name of all the columns.
names(chipo)

# Step 9. Which was the most-ordered item?
gchipo = groupby(chipo, :item_name)
combine(gchipo,sum,sort)