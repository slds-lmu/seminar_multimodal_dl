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



### Merge bibfiles:

library(bib2df)
df <- bib2df("book.bib")
df = bibtex::read.bib("book.bib")


getRefs = function(file = "book.bib") {
  lines = readLines(file)
  idx_ref = grep("@", lines)
  sapply(lines[idx_ref], function(l) {
    a = strsplit(l, "[{]")[[1]][2]
    return(strsplit(a, ",")[[1]][1])
  }, USE.NAMES = FALSE)
}
getRefLines = function(ref, file = "book.bib") {
  lines = readLines(file)
  lstart = grep(ref, lines, perl = TRUE)
  lend = lstart + 1
  rtype = strsplit(lines[lstart], "[{]")[[1]][1]
  rtype = gsub("@", "", rtype)

  found_end = FALSE
  while(! found_end) {
    if (grepl("@", lines[lend]) || (lend == length(lines))) {
      found_end = TRUE
    } else {
      lend = lend + 1
    }
  }
  return(lines[seq(lstart, lend - 1)])
}

#getRefLines(ref)
#rfs = getRefs("book.bib")

mergeBibs = function(bprio, badd, bnew) {
  refs_prio = getRefs(bprio)
  refs_add = getRefs(badd)

  refs_add = refs_add[! refs_add %in% refs_prio]
  ls = readLines(bprio)
  for (ref in refs_add) {
    message(ref)
    ls = c(ls, getRefLines(ref, badd))
  }
  writeLines(ls, bnew)
}
#mergeBibs("book.bib", "bibfiles/03-01img2text_luyang.bib", "tmp.bib")

bfiles = list.files("bibfiles", full.names = TRUE)
mergeBibs("book.bib", bfiles[1], "tmp.bib")
for (bf in bfiles[-1]) {
  message("Reading:", bf)
  mergeBibs("tmp.bib", bf, "tmp.bib")
}

