BEGIN {
    # Define the divisor limit
    divisorLimit = 500

    # Initialize variables
    n = 1
    triangleNumber = 0

    # Loop to find the first triangle number with more than divisorLimit divisors
    while (1) {
        # Calculate the next triangle number
        triangleNumber += n

        # Count the number of divisors for the current triangle number
        numDivisors = countDivisors(triangleNumber)

        # Check if the number of divisors exceeds the limit
        if (numDivisors > divisorLimit) {
            print "The first triangle number with more than", divisorLimit, "divisors is", triangleNumber
            break
        }

        # Increment n for the next iteration
        n++
    }
}

# Function to count the number of divisors of a given number
function countDivisors(num) {
    count = 0
    sqrtNum = int(sqrt(num))

    for (i = 1; i <= sqrtNum; i++) {
        if (num % i == 0) {
            if (i * i == num) {
                count++ # i and num/i are the same
            } else {
                count += 2 # i and num/i are different
            }
        }
    }

    return count
}