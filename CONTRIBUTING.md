# Contributing to the booklet

1. Craete a new branch with __unique__ and __identifieable__ name. E.g. if you work on chapter 02-01, create a new branch `02-01-xyz` with `xyz` your name or the chapter name.
    - You can to this by clicking `master` on the home site of the repository or
    - using `git checkout -b 02-01-xyz` in the terminal after cloning the repository.
2. Work on the respective `.Rmd` file in the main directory. Also add code or figures as you like, __but__ use a meaningful naming scheme so that there are not overlaps with other chapters.
3. Push your changes into your branch
4. If you have finished editing your chapter and want to have the changes visible on the website do the following:
    - Check locally that the book compiles! Do not hesitate to ask for help if you have troubles setting up `R` and `bookdown`.
    - After checking if everything compiles nicely, create a pull request from your branch to the `master` branch. 
    - One of the supervisors will test the PR and merge it into the `master` branch.

#### Hints:
- To have a look at the basic `markdown` editing see [here](https://github.com/slds-lmu/seminar_website_skeleton/blob/master/01-chapter1.Rmd).
- There are a lot of free resources if you are not familiar with git. E.g. this [free course](https://lab.github.com/githubtraining/introduction-to-github) or [this tutorial](https://www.w3schools.com/git/git_intro.asp?remote=github). 
