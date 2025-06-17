largest_prime_factor <- function(n) {
  max_prime <- -1

  # Remove all factors of 2
  while (n %% 2 == 0) {
    max_prime <- 2
    n <- n %/% 2
  }

  # Check odd numbers from 3 upwards
  i <- 3
  while (i * i <= n) {
    while (n %% i == 0) {
      max_prime <- i
      n <- n %/% i
    }
    i <- i + 2
  }

  # If remaining n is a prime number greater than 2
  if (n > 2) {
    max_prime <- n
  }

  return(max_prime)
}

number <- 600851475143
result <- largest_prime_factor(number)
cat("The largest prime factor of", number, "is", result, "\n")