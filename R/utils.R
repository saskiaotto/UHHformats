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
word_document_format <- function(format, filename, ...) {
  template = find_resource(format, file = filename)
  fmt <- bookdown::word_document2(..., reference_docx = template)
  return(fmt)
}


# Helper function to copy font files under different name into working directory
copy_font_files <- function(template, font) {
  file_copy <- function(template, font, input, output) {
    file.copy(
      from = find_resource(template, file = file.path("fonts", font, input)),
      to = file.path(".", output), overwrite = TRUE
    )
  }
  if (font == "Helvetica") {
    file_copy(template, font, "HelveticaNeue-Light-08.ttf", "font_regular.ttf")
    file_copy(template, font, "HelveticaNeue-LightItalic-09.ttf", "font_italic.ttf")
    file_copy(template, font, "HelveticaNeue-Bold-02.ttf", "font_bold.ttf")
    file_copy(template, font, "HelveticaNeue-BoldItalic-04.ttf", "font_bolditalic.ttf")
  }
  if (font == "TheSansUHH") {
    file_copy(template, font, "ftsr8a.ttf", "font_regular.ttf")
    file_copy(template, font, "ftsri8a.ttf", "font_italic.ttf")
    file_copy(template, font, "ftsb8a.ttf", "font_bold.ttf")
    file_copy(template, font, "ftsbi8a.ttf", "font_bolditalic.ttf")
  }
}

