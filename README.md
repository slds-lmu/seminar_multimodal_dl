# Seminar Book Skeleton

## Setup a new seminar repo

This skeleton was design by using the [Limitations of Interpretable Machine Learning Methods seminar](https://github.com/compstat-lmu/iml_methods_limitations) as template.

1. Create a new repository for your seminar.
1. Download, clone, whatever the files from the skeleton repo (this repo) and copy all files except the `.git` folder (or select `seminar_website_skeleton` as template when creating a new repository).
1. Update `DESCRIPTION`:
    - Adjust `Package` with your seminar name
    - Adjust `Title` with your title
    - Put each package in the `Depends` section that is required to build the book
1. Update `index.Rmd`:
    - Adjust `title` to your seminar title
    - Adjust `description` to a short description of the seminar
    - If present, uncomment the image with the `cover-image` and put it into the YAML header
    - Adjust the content to your needs, e.g. write a preface and foreword
    - If not otherwise requested, I would suggest to leave Chris as author of the foreword to give him credit for his effort
1. Update `README.md`:
    - Use your seminar title as title
    - Write a small intro that readers knows what the seminar is about
    - You can leave everything below `How this book came about`
1. Update `_output.yml`:
    - Adjust `before` and insert the title of the book
    - Adjust `edit` and insert the url to the repo
1. Update `_bookdown.yml`:
    - Adjust `repo` and, again, insert the url of the repo
1. Update `98-acknowledgments.Rmd`:
    - Insert supervising professor (and link)
    - If requested, insert other acknowledgements (e.g. ZDB)

Run `make' to` test if everything works fine and can be build.

## Style guide

### Structuring of files

There are four subdirectories:

- code
- data
- figures
- results


### Naming convention

The proposed convention here does not have to be adopted. It's just a suggestion for a possible naming scheme. __But__: Think about useful naming schemes, otherwise the repo might get very messy!

- Chapters are saved in the home directory of the repository and have a prefix `xx-chapter-name.Rmd` (e.g. `01-about-linear-models.Rmd`)
- Code, data, figures, and results are stored in the directories mentioned above in subdirectories that are named as the chapter itself. E.g. the R code `fit-linear-model.R` for the chapter `01-about-linear-models.Rmd` is saved in `code/01-about-linaer-models/fit-linear-model.R`. The same holds for data, figures, and results.

## Set up GitHub actions

- [Optional when created from template] Create a new Branch `gh-pages`. This one should then automatically set as built branch in the settings.
- Push something in the master to trigger the auto build.
- Add a valid email in `.github/workflows/deploy-bookdown.yaml`

## How this book came about

This book is the result of a student seminar for Master Statistics and Master Data Science at the LMU in the summer semester 2020.
Each student in the seminar wrote about a specific chapter of the book to pass the seminar.

## How to build the book

Step 0: Prerequisites

Make sure you have git and R up and running on your computer.

Step 1: Clone the repository to your machine

With RStudio: https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN

With command-line:
```
git clone git@github.com:compstat-lmu/seminar_website_skeleton.git
```

Step 2: Install dependencies

Start R in the project folder:

```
install.packages("devtools")
devtools::install_dev_deps()
```

Step 3: Render the book (R commands)

```{r}
# HTML
bookdown::render_book('./', 'bookdown::gitbook')
# PDF
bookdown::render_book('./', 'bookdown::pdf_book')
```


