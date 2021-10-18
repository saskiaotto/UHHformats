#' Convert to PDF/\LaTeX thesis document in English
#'
#' This function serves as wrapper to \code{\link[bookdown]{pdf_book}}, with different
#' default values (e.g., \code{highlight = default}), a custom Pandoc \LaTeX template
#' and different knitr default values (e.g., \code{fig.align = "center"}).
#' It is called from the initial R Markdown template file, which should be named `index.Rmd`.
#' The function is based on the `thesis_pdf` function of the
#' \href{https://github.com/ismayc/thesisdown}{thesisdown} package.
#'
#' @param toc logical; \code{TRUE} to include a table of contents in the output.
#' @param toc_depth integer; Depth of headers to include in table of contents. Default set to 5.
#' @param highlight character; syntax highlighting style. Supported styles include "default",
#'        "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock".
#'        Pass \code{NULL} to prevent syntax highlighting.
#' @param citation_package character; the \LaTeX package to process "citations", "natbib" (default) or
#'        "biblatex". Use "none" if neither package is to be used.
#' @param ... Additional parameters to pass to \code{\link[bookdown]{pdf_book}}.
#' @return A modified \code{\link[rmarkdown]{pdf_document}} based on the UHH LaTeX template.
#'
#' @return R Markdown output format to pass to \code{\link[bookdown]{render_book}}
#' @export
#'
#' @examples
#' \dontrun{
#'  # put in YAML header:
#'  output: UHHformats::pdf_thesis_en
#' }
pdf_thesis_en <- function(toc = TRUE, toc_depth = 5, highlight = "default",
  citation_package = "natbib", ...) {

  base <- bookdown::pdf_book(
    template    = "template.tex",
    toc         = toc,
    toc_depth   = toc_depth,
    highlight   = highlight,
    keep_tex    = TRUE,
    pandoc_args = "--top-level-division=section",
    ...
  )

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment   <- NA

  # To ensure images are in correct place (in line with text)
  base$knitr$opts_chunk$fig.align <- "center"
  # base$knitr$opts_chunk$fig.pos    <- "H"
  # base$knitr$opts_chunk$out.extra  <- ""

  # For tables
  options(knitr.table.format = "latex")
  options(kableExtra.latex.load_packages = FALSE)

  old_opt <- getOption("bookdown.post.latex")
  options(bookdown.post.latex = fix_envs)
  on.exit(options(bookdown.post.late = old_opt))

  return(base)
}


#' Convert to PDF/\LaTeX thesis document in German
#'
#' This function serves as wrapper to \code{\link[bookdown]{pdf_book}}, with different
#' default values (e.g., \code{highlight = default}), a custom Pandoc \LaTeX template
#' and different knitr default values (e.g., \code{fig.align = "center"}).
#' It is called from the initial R Markdown template file, which should be named `index.Rmd`.
#' The function is based on the `thesis_pdf` function of the
#' \href{https://github.com/ismayc/thesisdown}{thesisdown} package.
#'
#' @param toc logical; \code{TRUE} to include a table of contents in the output.
#' @param toc_depth integer; Depth of headers to include in table of contents. Default set to 5.
#' @param highlight character; syntax highlighting style. Supported styles include "default",
#'        "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock".
#'        Pass \code{NULL} to prevent syntax highlighting.
#' @param citation_package character; the \LaTeX package to process "citations", "natbib" (default) or
#'        "biblatex". Use "none" if neither package is to be used.
#' @param ... Additional parameters to pass to \code{\link[bookdown]{pdf_book}}.
#' @return A modified \code{\link[rmarkdown]{pdf_document}} based on the UHH LaTeX template.
#' @export
#'
#' @return R Markdown output format to pass to \code{\link[bookdown]{render_book}}
#' @examples
#' \dontrun{
#'  # put in YAML header:
#'  output: UHHformats::pdf_thesis_de
#' }
pdf_thesis_de <- function(toc = TRUE, toc_depth = 5, highlight = "default",
  citation_package = "natbib", ...) {

  base <- bookdown::pdf_book(
    template    = "template.tex",
    toc         = toc,
    toc_depth   = toc_depth,
    highlight   = highlight,
    keep_tex    = TRUE,
    pandoc_args = "--top-level-division=section",
    ...
  )

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment   <- NA

  # To ensure images are in correct place (in line with text)
  base$knitr$opts_chunk$fig.align <- "center"
  # base$knitr$opts_chunk$fig.pos    <- "H"
  # base$knitr$opts_chunk$out.extra  <- ""

  # For tables
  options(knitr.table.format = "latex")
  options(kableExtra.latex.load_packages = FALSE)

  old_opt <- getOption("bookdown.post.latex")
  options(bookdown.post.latex = fix_envs)
  on.exit(options(bookdown.post.late = old_opt))

  return(base)
}

fix_envs = function(x) {
  beg_reg <- '^\\s*\\\\begin\\{.*\\}'
  end_reg <- '^\\s*\\\\end\\{.*\\}'
  i3      <- if (length(i1 <- grep(beg_reg, x))) {
    (i1 - 1)[grepl("^\\s*$", x[i1 - 1])]
  }
  i3      <- c(
    i3,
    if (length(i2 <- grep(end_reg, x))) {
      (i2 + 1)[grepl("^\\s*$", x[i2 + 1])]
    }
  )
  if (length(i3)) {
    x <- x[-i3]
  }
  return(x)
}
