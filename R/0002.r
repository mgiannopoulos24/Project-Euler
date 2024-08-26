# Function to calculate the sum of even-valued Fibonacci numbers up to a given limit
sum_even_fibonacci <- function(limit) {
  # Initialize the first two Fibonacci numbers
  a <- 1
  b <- 2
  even_sum <- 0
  
  # Loop to generate Fibonacci numbers and sum the even ones
  while (a <= limit) {
    if (a %% 2 == 0) {
      even_sum <- even_sum + a
    }
    # Generate the next Fibonacci number
    next_fib <- a + b
    a <- b
    b <- next_fib
  }
  
  return(even_sum)
}

# Define the limit (4 million)
limit <- 4000000

# Calculate the sum of even-valued Fibonacci numbers
result <- sum_even_fibonacci(limit)

# Print the result
cat("The sum of the even-valued terms is:", result, "\n")
