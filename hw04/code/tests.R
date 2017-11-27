context("Remove Missing")

test_that("remove-missing works properly", {
  expect_equal(remove_missing(c(1, 5, 6, 9, NA)), c(1, 5, 6, 9))
  expect_equal(remove_missing(c(2, 5)), c(2,5))
  expect_equal(remove_missing(c(NA, 2, 1, NA)), c(2, 1))
  expect_equal(remove_missing(c(2, 5, 3)), c(2,5, 3))
}) 

context("Get Minimimum")

test_that("get_minimimum works properly" , {
  expect_equal(get_minimum(c(1, 5, 6, 4)), 1)
  expect_equal(get_minimum(c(2, 5)), 2)
  expect_equal(get_minimum(c(NA, 4, 3, NA)), 3)
  expect_equal(get_minimum(c(1, 3)), 1)
}) 

test_that("get_minimum throws error", {
  strings <- c("a", "b", "c")
  expect_error(get_minimum(strings))
})

context("Get Maximum")

test_that("get_maximum works properly" , {
  expect_equal(get_maximum(c(1, 5, 6, 4)), 6)
  expect_equal(get_maximum(c(2, 5)), 5)
  expect_equal(get_maximum(c(NA, 4, 3, NA)), 4)
  expect_equal(get_maximum(c(1, 3)), 3)
}) 

test_that("get_maximum throws error", {
  strings <- c("a", "b", "c")
  expect_error(get_maximum(strings))
})

context("Get Range")

test_that("get_range works properly" , {
  expect_equal(get_range(c(1, 5, 6, 4)), 5)
  expect_equal(get_range(c(2, 5)), 3)
  expect_equal(get_range(c(NA, 4, 3, NA)), 1)
  expect_equal(get_range(c(1, 3)), 2)
}) 

test_that("get_range throws error", {
  strings <- c("a", "b", "c")
  expect_error(get_range(strings))
})

context("Get 10th Percentile")

test_that("get_percentile10 works properly" , {
  expect_equal(get_percentile10(c(1, 5, 6, 4)), 1.9)
  expect_equal(get_percentile10(c(2, 5)), 2.3)
  expect_equal(get_percentile10(c(0, 10)), 1)
  expect_equal(get_percentile10(c(1, 3)), 1.2)
}) 

test_that("get_percentile10 throws error", {
  strings <- c("a", "b", "c")
  expect_error(get_percentile10(strings))
})

context("Get 90th Percentile")

test_that("get_percentile90 works properly" , {
  expect_equal(get_percentile90(c(1, 5, 6, 4)), 5.7)
  expect_equal(get_percentile90(c(0, 20)), 18)
  expect_equal(get_percentile90(c(0, 10)), 9)
  expect_equal(get_percentile90(c(0, 5)), 4.5)
}) 

test_that("get_percentile90 throws error", {
  strings <- c("a", "b", "c")
  expect_error(get_percentile90(strings))
})

context("Get Median")

test_that("get_mediaan works properly" , {
  expect_equal(get_median(c(1, 5, 6, 4)), 4.5)
  expect_equal(get_median(c(2, 5)), 3.5)
  expect_equal(get_median(c(NA, 4, 3, NA)), 3.5)
  expect_equal(get_median(c(1, 3)), 2)
}) 

test_that("get_median throws error", {
  strings <- c("a", "b", "c")
  expect_error(get_median(strings))
})

context("Get Average")

test_that("get_average works properly" , {
  expect_equal(get_average(c(1, 5, 6, 4)), 4)
  expect_equal(get_average(c(1, 2, 3, 4)), 2.5)
  expect_equal(get_average(c(4, 3)), 3.5)
  expect_equal(get_average(c(1, 3)), 2)
}) 

test_that("get_average throws error", {
  strings <- c("a", "b", "c")
  expect_error(get_average(strings))
})

context("Get Stdev")

test_that("get_stdev works properly" , {
  expect_equal(get_stdev(c(3,6,9)), 3)
  expect_equal(get_stdev(c(2,4,6)), 2)
  expect_equal(get_stdev(c(1,3,5)), 2)
  expect_equal(get_stdev(c(0,5,10)), 5)
}) 

test_that("get_stdev throws error", {
  strings <- c("a", "b", "c")
  expect_error(get_stdev(strings))
})

context("Get 1st Quartile")

test_that("get_quartile1 works properly" , {
  expect_equal(get_quartile1(c(1, 5, 6, 4)), 3.25)
  expect_equal(get_quartile1(c(1, 2, 3, 4)), 1.75)
  expect_equal(get_quartile1(c(NA, 4, 3, NA)), 3.25)
  expect_equal(get_quartile1(c(1, 3)), 1.5)
}) 

context("Get 3rd Quartile")

test_that("get_quartile3 works properly" , {
  expect_equal(get_quartile3(c(1, 5, 6, 4)), 5.25)
  expect_equal(get_quartile3(c(1, 2, 3, 4)), 3.25)
  expect_equal(get_quartile3(c(NA, 4, 3, NA)), 3.75)
  expect_equal(get_quartile3(c(1, 3)), 2.5)
}) 

test_that("get_quartile3 throws error", {
  strings <- c("a", "b", "c")
  expect_error(get_quartile3(strings))
})

context("Count Missing Values")

test_that("count_missing works properly" , {
  expect_equal(count_missing(c(1, 5, 6, 4)), 0)
  expect_equal(count_missing(c(1, 2, 3, 4)), 0)
  expect_equal(count_missing(c(NA, 4, 3, NA)), 2)
  expect_equal(count_missing(c(1, NA)), 1)
}) 

context("Drop Lowest Value")

test_that("drop_lowest works properly" , {
  expect_equal(drop_lowest(c(1, 5, 6, 4)), c(5, 6, 4))
  expect_equal(drop_lowest(c(1, 2, 3, 4)), c(2, 3, 4))
  expect_equal(drop_lowest(c(5, 4, 3, 5)), c(5, 4, 5))
  expect_equal(drop_lowest(c(1, 5, 0, 0)), c(1, 5, 0))
}) 

context("Rescaling to 100")

test_that("rescale_00 works properly" , {
  expect_equal(rescale100(c(1, 5, 6, 4), xmin = 0, xmax = 10), c(10, 50, 60, 40))
  expect_equal(rescale100(c(1, 2, 3, 4), xmin = 0, xmax = 5), c(20, 40, 60, 80))
  expect_equal(rescale100(c(4, 3, 1), xmin = 0, xmax = 4), c(100, 75, 25))
  expect_equal(rescale100(c(1, 10), xmin = 0, xmax = 10), c(10, 100))
}) 

context("Homework Score")

test_that("score_homework works properly" , {
  expect_equal(score_homework(c(1, 5, 6, 4), drop = TRUE), 5)
  expect_equal(score_homework(c(1, 2, 3, 4), drop = TRUE), 3)
  expect_equal(score_homework(c(4, 3, 2), drop = FALSE), 3)
  expect_equal(score_homework(c(2, 10), drop = FALSE), 6)
}) 



context("Quiz Score")

test_that("score_quiz works properly" , {
  expect_equal(score_quiz(c(1, 5, 6, 4), drop = TRUE), 5)
  expect_equal(score_quiz(c(1, 2, 3, 4), drop = TRUE), 3)
  expect_equal(score_quiz(c(4, 3, 2), drop = FALSE), 3)
  expect_equal(score_quiz(c(2, 10), drop = FALSE), 6)
}) 

context("Lab Score")

test_that("score_lab works properly" , {
  expect_equal(score_lab(7), 20)
  expect_equal(score_lab(6), 0)
  expect_equal(score_lab(10), 80)
  expect_equal(score_lab(12), 100)
}) 





