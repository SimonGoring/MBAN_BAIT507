sizer <- function(object, size = "b") {
  assertthat::assert_that(length(size) == 1 &
    size %in%  c('b', 'kb', 'MB', 'TB'),
    msg = "size should be one of 'b', 'kb', 'MB' or 'TB'")

  div <- c(1, 1000, 1e6, 1e9)[which(c('b', 'kb', 'MB', 'TB') == size)]

  obj_size <- as.numeric(object.size(object)) / div
  format(obj_size, big.mark = ",", digits = 3)
}
