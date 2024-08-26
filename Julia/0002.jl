# Define the maximum value
const MAX_VALUE = 4000000

# Function to compute the sum of even Fibonacci numbers up to a given maximum value
function sum_even_fibonacci(max_val)
    term1 = 1
    term2 = 2
    sum_even = 0

    while term1 <= max_val
        # Check if the current term is even
        if term1 % 2 == 0
            sum_even += term1
        end

        # Generate the next term in the Fibonacci sequence
        next_term = term1 + term2
        term1 = term2
        term2 = next_term
    end

    return sum_even
end

# Compute the result
result = sum_even_fibonacci(MAX_VALUE)

# Output the result
println("Sum of the even-valued terms: ", result)
