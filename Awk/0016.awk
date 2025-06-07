BEGIN {
    MAX_DIGITS = 302  # Enough to store 2^1000
    split("", result) # Initialize the result array
    result[1] = 1     # Start with 2^0 = 1
    size = 1          # Number of digits in the result

    # Perform the multiplication 1000 times (2^1000)
    for (i = 1; i <= 1000; i++) {
        carry = 0
        for (j = 1; j <= size; j++) {
            prod = result[j] * 2 + carry
            result[j] = prod % 10
            carry = int(prod / 10)
        }
        while (carry > 0) {
            size++
            result[size] = carry % 10
            carry = int(carry / 10)
        }
    }

    # Calculate the sum of the digits
    sum = 0
    for (j = 1; j <= size; j++) {
        sum += result[j]
    }

    print "The sum of the digits of 2^1000 is:", sum
}