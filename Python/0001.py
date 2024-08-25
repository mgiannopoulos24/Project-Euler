def sum_of_multiples(limit):
    total_sum = 0
    for i in range(1, limit):
        if i % 3 == 0 or i % 5 == 0:
            total_sum += i
    return total_sum

# Define the limit
limit = 1000

# Calculate the result
result = sum_of_multiples(limit)

# Print the result
print(f"The sum of all multiples of 3 or 5 below {limit} is: {result}")
