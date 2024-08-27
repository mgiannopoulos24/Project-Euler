# Function to find the largest prime factor
largestPrimeFactor = (n) ->
  largest = 0
  
  # Remove all factors of 2
  while n % 2 is 0
    largest = 2
    n /= 2
  
  # Remove all factors of odd numbers
  i = 3
  while i * i <= n
    while n % i is 0
      largest = i
      n /= i
    i += 2
  
  # If n is a prime number greater than 2
  if n > 2
    largest = n
  
  largest

# Main execution
number = 600851475143
result = largestPrimeFactor(number)

console.log "The largest prime factor of #{number} is #{result}"
