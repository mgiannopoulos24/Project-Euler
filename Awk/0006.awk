BEGIN {
    # Initialize variables
    sum_of_squares = 0
    sum = 0

    # Loop through the first 100 natural numbers
    for (n = 1; n <= 100; n++) {
        # Calculate the sum of squares
        sum_of_squares += n * n

        # Calculate the sum of the numbers
        sum += n
    }

    # Calculate the square of the sum
    square_of_sum = sum * sum

    # Calculate the difference
    difference = square_of_sum - sum_of_squares

    # Output the result
    print "The difference is:", difference
}