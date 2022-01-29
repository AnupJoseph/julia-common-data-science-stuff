# Step 1. Import the necessary libraries
using DataFrames
using CSV
using Pipe
using DataFramesMeta

# Step 2. Import the dataset from this [address](https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/04_Apply/Students_Alcohol_Consumption/student-mat.csv).
URL = "https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/04_Apply/Students_Alcohol_Consumption/student-mat.csv"
download(URL, "student-mat.csv")

# Step 3. Assign it to a variable called df.
df = CSV.read("student-mat.csv", DataFrame)

# Step 4. For the purpose of this exercise slice the dataframe from 'school' until the 'guardian' column
stud_alcohol = select(df, Between("school", "guardian"))

# Step 5. Create a lambda function that will capitalize strings.
# Julia has an inbuilt function to do this so we won't make it
uppercasefirst("school")

# Step 6. Capitalize both Mjob and Fjob
stud_alcohol[!, :Mjob] = uppercasefirst.(stud_alcohol.Mjob)
stud_alcohol[!, :Fjob] = uppercasefirst.(stud_alcohol.Fjob)

# Step 7. Print the last elements of the data set.
last(stud_alcohol, 5)

# Step 9. Create a function called majority that returns a boolean value to a new column called legal_drinker (Consider majority as older than 17 years old)
majority(x) = x > 17 ? true : false
stud_alcohol[!, :legal_drinker] = majority.(stud_alcohol.age)

eltype.(eachcol(stud_alcohol))

# Step 10. Multiply every number of the dataset by 10.
by10(x) = 10x
stud_alcohol[!, names(stud_alcohol, Number)] = by10(stud_alcohol[!, names(stud_alcohol, Number)])