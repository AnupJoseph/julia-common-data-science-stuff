# Imports
using DataFrames
using CSV
using Pipe

# Step 2. Create 3 differents Series, each of length 100, as follows:
# 1. The first a random number from 1 to 4
# 2. The second a random number from 1 to 3
# 3. The third a random number from 10,000 to 30,000
s1 = rand(1:4, 100)
s2 = rand(1:3, 100)
s3 = rand(10000:30000, 100)

# Step 3. Let's create a DataFrame by joinning the Series by column
# Step 4. Change the name of the columns to bedrs, bathrs, price_sqr_meter
house_mkt = DataFrame((bedrs = s1, bathrs = s2, price_sqr_meter = s3))

# Step 5. Create a one column DataFrame with the values of the 3 Series and assign it to 'bigcolumn'
big_cols = DataFrame((bigcolumn = vcat(s1, s2, s3)))

# Step 6. Oops, it seems it is going only until index 99. Is it true?
# Step 7. Reindex the DataFrame so it goes from 0 to 299
# These problems actually don't exist in DataFrames.jl 