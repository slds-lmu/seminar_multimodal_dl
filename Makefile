all: html pdf epub

html: *.Rmd
	Rscript -e "bookdown::render_book('./', 'bookdown::gitbook', clean = FALSE)"

pdf: *.Rmd
	Rscript -e "bookdown::render_book('./', 'bookdown::pdf_book', clean = FALSE)"

epub : *.Rmd
	Rscript -e "bookdown::render_book('./', 'bookdown::epub_book', clean = FALSE)"

