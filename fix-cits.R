citeprog_file = here::here("citeprog-warnings.txt")
cplines = readLines(citeprog_file)

cplines_year = cplines[grepl("Warning--empty year", cplines)]
refs = sapply(cplines_year, function(cp) strsplit(cp, " in ")[[1]][2], USE.NAMES = FALSE)

addEntry = function(cit, bib_file = "book.bib", bib_out = "book.bib.new",
  entry = "YEAR", value = "XXXX", line_end = ",") {

  blines = readLines(bib_file)
  idx_ref = grep(paste0("[{]", cit, ","), blines)
  slines = blines[idx_ref]
  idx_ref = idx_ref[grep("@", slines)]

  if (length(idx_ref) == 0) {
    warning("Cannot find ref ", cit)
  } else {
    blines_top = blines[seq_len(idx_ref)]
    blines_bottom = blines[seq(idx_ref + 1, length(blines))]
    bline_add = paste0("  ", entry, " = {", value, "}", line_end)
    blines_new = c(blines_top, bline_add, blines_bottom)
    writeLines(blines_new, bib_out)
  }
  return(NULL)
}

removeEntry = function(cit, bib_file = "book.bib", bib.out = "book.bib.new", entry) {
  blines = readLines(bib_file)
  idx_ref = grep(cit, blines)
  blines_new = blines[-idx_ref]
  writeLines(blines_new, bib.out)
  return(NULL)
}

invisible(lapply(refs, addEntry, bib_file = "book.bib.new", bib_out = "book.bib.new"))

