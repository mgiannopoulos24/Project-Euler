BEGIN {
    # Initialize the first two terms of the Fibonacci sequence
    a = 1
    b = 2
    sum = 0

    # Iterate until the terms exceed four million
    while (a <= 4000000) {
        # Check if the term is even
        if (a % 2 == 0) {
            sum += a
        }

        # Generate the next Fibonacci number
        next_term = a + b
        a = b
        b = next_term
    }

    # Print the sum of the even-valued terms
    print "The sum of the even-valued terms is:", sum
}
