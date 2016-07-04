context("[OnDisk]MSnExp equality")

f <- msdata::proteomics(full.names = TRUE, pattern = "TMT_Erwinia_1")
inmem2 <- readMSData(f, msLevel = 2, verbose = FALSE)
ondisk <- MSnbase:::readMSData2(f)
ondisk1 <- MSnbase:::readMSData2(f, msLevel = 1)
ondisk2 <- MSnbase:::readMSData2(f, msLevel = 2)

test_that("Equality function", {
    expect_true(all.equal(inmem2, ondisk2))
    ## postive controls
    expect_true(all.equal(inmem2, inmem2))
    expect_true(all.equal(ondisk, ondisk))
    ## negative controls
    expect_false(isTRUE(all.equal(ondisk, ondisk1)))
    expect_false(isTRUE(all.equal(ondisk, ondisk2)))
})