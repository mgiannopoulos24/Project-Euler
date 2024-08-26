def sum_even_fibonacci(limit):
    # Initialize the first two Fibonacci numbers
    a, b = 1, 2
    even_sum = 0

    # Loop to generate Fibonacci numbers and sum the even ones
    while a <= limit:
        if a % 2 == 0:
            even_sum += a
        # Generate the next Fibonacci number
        a, b = b, a + b

    return even_sum

# Define the limit (4 million)
limit = 4000000

# Calculate the sum of even-valued Fibonacci numbers
result = sum_even_fibonacci(limit)

# Print the result
print("The sum of the even-valued terms is:", result)
