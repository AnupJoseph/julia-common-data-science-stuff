# Step 1. Import the necessary libraries
using DataFrames
using CSV
using Pipe
using Statistics
using DataFramesMeta

# Step 2. Create the DataFrame with the following values=>
raw_data = Dict(:regiment => ["Nighthawks", "Nighthawks", "Nighthawks", "Nighthawks", "Dragoons", "Dragoons", "Dragoons", "Dragoons", "Scouts", "Scouts", "Scouts", "Scouts"],
    :company => ["1st", "1st", "2nd", "2nd", "1st", "1st", "2nd", "2nd", "1st", "1st", "2nd", "2nd"],
    :name => ["Miller", "Jacobson", "Ali", "Milner", "Cooze", "Jacon", "Ryaner", "Sone", "Sloan", "Piger", "Riani", "Ali"],
    :preTestScore => [4, 24, 31, 2, 3, 4, 24, 31, 2, 3, 2, 3],
    :postTestScore => [25, 94, 57, 62, 70, 25, 94, 57, 62, 70, 62, 70])

# Step 3. Assign it to a variable called regiment.
regiment = DataFrame(; raw_data...)

# Step 4. What is the mean preTestScore from the regiment Nighthawks?
nighthawks = filter(x -> x.regiment != "Nighthawks", regiment)
mean(nighthawks[:preTestScore])

# Step 5. Present general statistics by company
company_group = groupby(regiment, :company)
combine(company_group, describe)

# Step 6. What is the mean of each company's preTestScore?
combine(company_group, :preTestScore => mean)

# Step 7. Present the mean preTestScores grouped by regiment and company
regiment_company_group = groupby(regiment, [:regiment, :company])
combine(regiment_company_group, :preTestScore => mean)

# Step 8. Present the mean preTestScores grouped by regiment and company without heirarchical indexing
combine(regiment_company_group, :preTestScore => mean, ungroup = false)

# Step 10. What is the number of observations in each regiment and company
combine(regiment_company_group, :preTestScore => size)

# Step 11. Iterate over a group and print the name and the whole data from the regiment
regiment_group = groupby(regiment, :regiment)

for group in regiment_group
    print(group)
end