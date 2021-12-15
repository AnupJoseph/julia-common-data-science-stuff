# Step 1. Import the necessary libraries
using CSV
using DataFrames


# Step 1. Go to https://www.kaggle.com/openfoodfacts/world-food-facts/data
# Step 2. Download the dataset to your computer and unzip it.


# Got the above link and download the dataset to your local machine and check the URL you have downloaded the zip file from(check the chrome://downloads page).Paste that URL into URL variable
URL = ""
download(URL, "archive.zip")
run(`unzip archive.zip`)

# Step 3. Use the tsv file and assign it to a dataframe called food
food = CSV.read("en.openfoodfacts.org.products.tsv", DataFrame, delim = "\t")

# Step 4. See the first 5 entries
first(food, 5)

# Step 5. What is the number of observations in the dataset?
# We already have it but I guess it would hurt to do it?
nrow(food)

# Step 6. What is the number of columns in the dataset?
ncol(food)

# Step 7. Print the name of all the columns.
names(food)

# Step 8. What is the name of 105th column?
# Always remember that Julia is 1-indexed
names(food)[105]

# Step 9. What is the type of the observations of the 105th column?
eltype(food[!, names(food)[105]])

# Step 10. How is the dataset indexed?
# DataFrames.jl doesn't have table indexing. It differs very sharply from pandas on this . Using grouby is the way if you necessarily need index.

# Step 11. What is the product name of the 19th observation?
food[19, "product_name"]