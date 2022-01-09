# Step 1. Import the necessary libraries
using DataFrames
using CSV
using Pipe

# Step 2. Import the dataset from this [address](https://raw.githubusercontent.com/justmarkham/DAT8/master/data/chipotle.tsv).
URL = "https://raw.githubusercontent.com/justmarkham/DAT8/master/data/chipotle.tsv"
download(URL, "chipotle.tsv")

# Step 3. Assign it to a variable called chipo.
chipo = CSV.read("chipotle.tsv", DataFrame, delim = "\t")

# Step 4. How many products cost more than $10.00?
transform!(chipo, :item_price => ByRow(x -> parse(Float32, x[2:end])) => :item_price)

greater_than10 = filter([:quantity, :item_price] => (x, y) -> x == 1 && y > 10, chipo)
unique(greater_than10[!, :quantity])

# Step 5. What is the price of each item?
# print a data frame with only two columns item_name and item_price
items = chipo[chipo.quantity.==1, [:item_name, :item_price]]
unique(items, 1)

# Step 6. Sort by the name of the item
sort(chipo, :item_name)

# Step 7. What was the quantity of the most expensive item ordered?
sort(chipo, :item_price, rev = true)[1, [:item_name, :quantity]]

# Step 8. How many times was a Veggie Salad Bowl ordered?
salad_orders = chipo[chipo.item_name.=="Veggie Salad Bowl", :]
nrow(salad_orders)

# Step 9. How many times did someone order more than one Canned Soda?
soda_orders = chipo[(chipo.item_name.=="Canned Soda").&(chipo.quantity.>1), :]