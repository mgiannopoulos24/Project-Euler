# Define a function to calculate the sum of multiples of 3 or 5 below a given limit
sum_of_multiples <- function(limit) {
  # Initialize sum
  total_sum <- 0
  
  # Loop through numbers from 1 to limit - 1
  for (i in 1:(limit - 1)) {
    if (i %% 3 == 0 || i %% 5 == 0) {
      total_sum <- total_sum + i
    }
  }
  
  return(total_sum)
}

# Define the limit
limit <- 1000

# Calculate the result
result <- sum_of_multiples(limit)

# Print the result
cat("The sum of all multiples of 3 or 5 below", limit, "is:", result, "\n")
