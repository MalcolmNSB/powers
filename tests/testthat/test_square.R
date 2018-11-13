context("Squaring non-numerics")

test_that("At least numeric values work.", {
    num_vec <- c(0, -4.6, 3.4)
    expect_identical(square(num_vec), num_vec^2)
    expect_identical(cube(num_vec), num_vec^3)
    expect_identical(reciprocal(num_vec), 1/num_vec)
})

test_that("Logicals automatically convert to numeric.", {
    logic_vec <- c(TRUE, TRUE, FALSE)
    expect_identical(square(logic_vec), logic_vec^2)
    expect_identical(cube(logic_vec), logic_vec^3)
})

test_that("Box_Cox returns logarithm of input when lambda = 0", {

    expect_identical(Box_Cox_transform(c(1,2), 0), c(log(1), log(2)))

})
test_that("Different cases work", {
    expect_identical(Box_Cox_transform(c(1,2), 1), c(0,1))
    expect_identical(Box_Cox_transform(c(4,4), c(-1,-3)), c(0,0))
    expect_identical(Box_Cox_transform(c(5,7), c(0,-3)), log(c(2,4)))
    expect_identical(Box_Cox_transform(1,1), 0)

})
