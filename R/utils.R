#-----------------------------------------------------------------------
# The following helper functions were adopted from the 'rticles' package
#-----------------------------------------------------------------------

find_resource <- function(template, file) {
  res <- system.file(
    "rmarkdown", "templates", template, "resources", file, package = "UHHformats"
  )
  if (res == "") stop(
    "Couldn't find template file ", template, "/resources/", file, call. = FALSE
  )
  res
}


# Helper function to create a custom format derived from  rmarkdown::pdf_document
# that includes a custom LaTeX template
pdf_document_format <- function(
  format, template = find_resource(format, file = 'template.tex'), ...) {
  fmt <- rmarkdown::pdf_document(..., template = template)
  fmt$inherits <- "pdf_document"
  return(fmt)
}


# Helper function to create a custom format derived from bookdown::word_document2
# that includes a custom UHH Word template
word_document_format <- function(
  format, template = find_resource(format, file = 'uhh-template.docx'), ...) {
  fmt <- bookdown::word_document2(..., reference_docx = template)
  return(fmt)
}
