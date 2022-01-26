# Step 1. Import the necessary libraries
using DataFrames
using CSV
using Pipe
using Statistics

# Step 2. Import the dataset from this [address](https://raw.githubusercontent.com/justmarkham/DAT8/master/data/u.user).
URL = "https://raw.githubusercontent.com/justmarkham/DAT8/master/data/u.user"
download(URL, "u.user")

# Step 3. Assign it to a variable called users.
users = CSV.read("u.user", delim = "|", DataFrame)

# Step 4. Discover what is the mean age per occupation
@pipe users |> groupby(_, :occupation) |> combine(_, :age => mean)

# Step 5. Discover the Male ratio per occupation and sort it from the most to the least
convert_num(x) = x == "M" ? 1 : 0
users[:gender_num] = convert_num.(users[:gender])

male_ratio = @pipe users |> groupby(_, :occupation) |> combine(_, :gender_num => (x -> sum(x) / length(x)))

# Step 6. For each occupation, calculate the minimum and maximum ages
@pipe users |> groupby(_, :occupation) |> combine(_, :age => minimum, :age => maximum)

# Step 7. For each combination of occupation and gender, calculate the mean age
@pipe users |> groupby(_, [:occupation, :gender]) |> combine(_, :age => mean)

# Step 8. For each occupation present the percentage of women and men
agg = combine(groupby(users, [:occupation, :gender]), :gender => length => :count)
transform(groupby(agg, [:occupation]), :count => (x -> x / sum(x) * 100) => :age_percentage)