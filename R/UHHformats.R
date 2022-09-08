#' UHHformats: R Markdown templates designed for the University of Hamburg
#'
#' A package for creating HTML, PDF and Microsoft Word documents, reports,
#' and cheat sheets using R Markdown.
#'
#' @section Quarto templates:
#' The following templates can be created using the function \code{\link{create_quarto_doc}}
#' and setting the \emph{template} argument to the following type:
#' \itemize{
#'   \item \emph{html}: Creates a simple HTML document with a
#'     fixed navigation bar on the left side.
#'   \item \emph{word}: Creates a simple MS Word document in English
#'     (default) and German.
#'   \item \emph{pdf_simple}: Creates a simple PDF/LaTeX document in
#'     English (default) and German.
#'   \item \emph{pdf_report}: Creates a report-like PDF/LaTeX document in
#'     English (default) and German.
#' }
#'
#'
#' @section R Markdown templates:
#' The following templates can be created using RStudios IDE or by using the
#' function \code{\link{create_rmd_doc}}:
#' \itemize{
#'   \item \code{\link{html_simple}}: Creates a simple HTML document with a
#'     fixed table of content.
#'   \item \code{\link{html_material}}: Creates a HTML document based on the
#'     bootstrap design 'material'.
#'   \item \code{\link{word_doc}}: Creates a simple MS Word document in English
#'     (default) and German.
#'   \item \code{\link{pdf_simple}}: Creates a simple PDF/LaTeX document in
#'     English (default) and German.
#'   \item \code{\link{pdf_report}}: Creates a report-like PDF/LaTeX document in
#'     English (default) and German.
#'   \item \code{\link{pdf_cheatsheet}}: Creates a simple PDF cheatsheet with
#'     box layouts.
#'   \item \code{\link{rmd_to_jupyter}}: Creates a Jupyter Notebook from a R
#'     Markdown file.
#' }
#' @docType package
#' @name UHHformats
NULL
