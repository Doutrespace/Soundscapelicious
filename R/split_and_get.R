
#' @export
#' @examples
#' splitAndGet("R programming is awesome!")
splitAndGet <- function(x) {

  lapply(strsplit(x, " "), c) # Why c? strsplit will return a list

}
