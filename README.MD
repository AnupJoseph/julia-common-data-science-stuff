The idea behind this repo is to have a reference for general everyday data science tasks that you would do using say numpy and pandas in Python or tidyverse in R using the Julia programming language tools.
My plan is to use the [numpy-100](https://github.com/rougier/numpy-100) repo as a starting point and then see where to go from there.

At the moment I have finished all the one star and 2 star questions in the [numpy-100](https://github.com/rougier/numpy-100) repo. I am not going through the 3 star problems as lot of them focus on very specific numpy concepts which are, in my opinion, not very relevant in Julia. 

My next step is to solve the questions in the excellent [pandas_exercises](https://github.com/guipsamora/pandas_exercises) repo by [Guilherme Samora](https://github.com/guipsamora) using [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl). I am also going to solve the problems using [Queryverse.jl](https://www.queryverse.org/) as it feels like a very nice approach and might be more useful for R programmmers

**Warning**: Before you use this code anywhere you should know that I am by no means an experienced Julia user. There's almost certainly a more efficent way to do the tasks in this repo. If you know a better way, feel free to open a pull request or just mention it in an issue and I'll try to follow up later.

The repo is organized like so
* Notebooks - The notebooks have the core code in a question and answer format. Each of the notebooks have a shellscript which allows the notebook to run on Google Colab
* working - Working directory has the `.jl` files for the same thing and will be removed at a later date