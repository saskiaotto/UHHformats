#' Create a new directory with the R Markdown template
#'
#' \code{create_quarto_doc} creates a new subdirectory inside the current directory, which will
#' contain the ready-to-use R Markdown file and all associated files. It can be used with
#' all Quarto-based templates.
#'
#' @param dirname Name of the directory to create.
#' @param template The template type to use. Choose "html" (default), "pdf"
#'   or "word".
#'
#' @examples
#' \dontrun{
#' create_quarto_doc("my_word-doc", template = "word")
#' }
#' @export

create_quarto_doc <- function(dirname = "new-doc", template = "html") {
    templates <- c("html", "pdf", "word")
    template <- match.arg(template, templates)
    tmp.dir <- paste(dirname, "_tmp", sep = "")
    if (file.exists(dirname) || file.exists(tmp.dir)) {
        stop(paste("Cannot run create_quarto_doc() from a directory containing",
                   dirname, "or", tmp.dir))
    }
    dir.create(tmp.dir)
    template_dir <- template

    # get all file names in the template folder
    list_of_files <- list.files(
      system.file(file.path("quarto", "templates", template_dir),
                          package = "UHHformats"))

    # copy all single files and subfolders into new path
    for (i in seq_along(list_of_files)) {
      file.copy(system.file(file.path("quarto", "templates", template_dir, list_of_files[i]),
                          package = "UHHformats"), file.path(tmp.dir), recursive = TRUE)
    }

    file.rename(tmp.dir, dirname)
    file.rename(file.path(dirname, "skeleton.qmd"), file.path(dirname, paste0(dirname, ".qmd")))
    unlink(tmp.dir, recursive = TRUE)
}

