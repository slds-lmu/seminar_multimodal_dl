# Seminar: Multimodal Deep Learning

## Setup a new seminar repo

In the last few years, there have been several breakthroughs in the methodologies used in Natural Language Processing (NLP) as well as Computer Vision (CV). Beyond these improvements on single-modality models, large-scale multi-modal approaches have become a very active area of research.

In this seminar, we are planning to review these approaches and create a solid overview of the field, starting with the current state-of-the-art approaches in the two subfields of Deep Learning individually. We will further discuss modeling frameworks, where one modality is transformed into the other as well as models in which one modality is utilized to enhance representation learning for the other. Finally, we plan to also potentially cover other modalities as well as general-purpose multi-modal models, which are able to handle different tasks on different modalities within one unified architecture. Interesting applications/use cases could also be potential topics for a seminar paper.

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
git clone git@github.com/slds-lmu/seminar_multimodal_dl.git
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


