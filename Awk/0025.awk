BEGIN {
    phi = (1 + sqrt(5)) / 2
    log_phi = log(phi) / log(10)
    log_sqrt_5 = log(sqrt(5)) / log(10)

    n = int( (999 + log_sqrt_5) / log_phi + 0.999999 )  # ceil() workaround

    printf "The index of the first Fibonacci term to contain 1000 digits is: %d\n", n
}