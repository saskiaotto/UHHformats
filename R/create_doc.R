#' Create a new directory with the R Markdown template
#'
#' \code{create_doc} creates a new subdirectory inside the current directory, which will
#' contain the ready-to-use R Markdown file and all associated files. It can be used with
#' all UHHformats templates, except for \code{rmd_to_jupyter}.
#'
#' @param dirname Name of the directory to create.
#' @param template The name of the template to use. Default is "html_simple", other
#'   options are "html_material", "pdf_report", "pdf_thesis_en", and
#'   "pdf_thesis_dt".
#' @details
#' The function is a modified version of the `create.doc` function in the
#' \href{https://github.com/juba/rmdformats}{rmdformats} package.
#'
#' @examples
#' \dontrun{
#' create_doc("my_report", template = "pdf_report")
#' }
#' @export

create_doc <- function(dirname = "new-doc", template = "html_simple") {
    templates <- c("html_material", "html_simple", "pdf_report", "pdf_thesis_en",
      "pdf_thesis_dt")
    template <- match.arg(template, templates)
    tmp.dir <- paste(dirname, "_tmp", sep = "")
    if (file.exists(dirname) || file.exists(tmp.dir)) {
        stop(paste("Cannot run create.doc() from a directory containing",
                   dirname, "or", tmp.dir))
    }
    dir.create(tmp.dir)
    template_dir <- template

    # get all file names in the /skeleton folder
    list_of_files <- list.files(
      system.file(file.path("rmarkdown", "templates", template_dir, "skeleton"),
                          package = "UHHformats"))

    # copy all single files and subfolders into new path
    for (i in seq_along(list_of_files)) {
      file.copy(system.file(file.path("rmarkdown", "templates", template_dir, "skeleton", list_of_files[i]),
                          package = "UHHformats"), file.path(tmp.dir), recursive = TRUE)
    }

    file.rename(tmp.dir, dirname)
    file.rename(file.path(dirname, "skeleton.Rmd"), file.path(dirname, paste0(dirname, ".Rmd")))
    unlink(tmp.dir, recursive = TRUE)
}

