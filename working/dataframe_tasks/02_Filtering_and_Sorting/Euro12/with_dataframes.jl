# Step 1. Import the necessary libraries
using DataFrames
using CSV
using Pipe
using Statistics

# Step 2. Import the dataset from this [address](https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/02_Filtering_%26_Sorting/Euro12/Euro_2012_stats_TEAM.csv).
URL = "https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/02_Filtering_%26_Sorting/Euro12/Euro_2012_stats_TEAM.csv"
download(URL, "euro_stats.csv")

# Step 3. Assign it to a variable called euro12.
euro12 = CSV.read("euro_stats.csv", DataFrame)

# Step 4. Select only the Goal column.
euro12.Goals

# Step 5. How many team participated in the Euro2012?
num_teams = nrow(euro12)

# Step 6. What is the number of columns in the dataset?
n_cols = ncol(euro12)

# Step 7. View only the columns Team, Yellow Cards and Red Cards and assign them to a dataframe called discipline
discipline = euro12[!, ["Team", "Yellow Cards", "Red Cards"]]


# Step 8. Sort the teams by Red Cards, then to Yellow Cards
sort(discipline, [order("Red Cards", rev = true), "Yellow Cards"])

# Step 9. Calculate the mean Yellow Cards given per Team
mean(discipline["Yellow Cards"])

# Step 10. Filter teams that scored more than 6 goals
euro12[euro12.Goals.>2, :]

# Step 11. Select the teams that start with G
euro12[startswith.(euro12[:Team], "G"), :]

# Step 12. Select the first 7 columns
euro12[!, 1:7]

# Step 13. Select all columns except the last 3.
euro12[!, 1:end-3]

# Step 14. Present only the Shooting Accuracy from England, Italy and Russia
country_eq(x) =   in(x, ["England", "Italy", "Russia"])
filter(x->country_eq.(x[:Team]) ,euro12)[!,["Team","Shooting Accuracy"]]