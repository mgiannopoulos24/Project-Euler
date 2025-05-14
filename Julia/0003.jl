# Function to find the largest prime factor
function largest_prime_factor(n::Int64)
    # Initialize largest factor
    largest = 0

    # Remove all factors of 2
    while n % 2 == 0
        largest = 2
        n ÷= 2
    end

    # Check for odd factors up to sqrt(n)
    i = 3
    while i * i <= n
        while n % i == 0
            largest = i
            n ÷= i
        end
        i += 2
    end

    # If remaining n is a prime number > 2
    if n > 2
        largest = n
    end

    return largest
end

# Given number
number = 600851475143

# Compute result
result = largest_prime_factor(number)

# Print result
println("The largest prime factor of $number is $result")