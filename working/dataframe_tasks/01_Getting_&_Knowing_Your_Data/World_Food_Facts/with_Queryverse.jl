# Step 1. Import the necessary libraries
using Que

# Step 1. Go to https://www.kaggle.com/openfoodfacts/world-food-facts/data
# Step 2. Download the dataset to your computer and unzip it.


# Got the above link and download the dataset to your local machine and check the URL you have downloaded the zip file from(check the chrome://downloads page).Paste that URL into URL variable
URL = ""
download(URL, "archive.zip")
run(`unzip archive.zip`)