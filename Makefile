all: html pdf epub

html: *.Rmd
	Rscript -e "bookdown::render_book('./', 'bookdown::gitbook')"

pdf: *.Rmd
	Rscript -e "bookdown::render_book('./', 'bookdown::pdf_book')"

epub : *.Rmd
	Rscript -e "bookdown::render_book('./', 'bookdown::epub_book')"

