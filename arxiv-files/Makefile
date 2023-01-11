ENGINE    = pdflatex
BIBENGINE = bibtex
FILE      = book
MAKE      = make

.PHONY: all clean compile bcompile

all:
	@$(MAKE) --no-print-directory clean
	@$(MAKE) --no-print-directory compile || true
	@$(MAKE) --no-print-directory bcompile
	@$(MAKE) --no-print-directory compile
	@$(MAKE) --no-print-directory compile
	@$(MAKE) --no-print-directory clean

clean:
	@rm "$(FILE).aux" \
 	    "$(FILE).log" \
 		  "$(FILE).toc" \
 		  "$(FILE).blg" \
      #"$(FILE).bbl" \
 		  "$(FILE).lof" \
 		  "$(FILE).lot" \
 		  "$(FILE).out" \
 		  "$(FILE).idx" \
 		  "$(FILE).dvi"  || true

compile:
	$(ENGINE) "$(FILE).tex"

bcompile:
	$(BIBENGINE) "$(FILE).aux"
