BEGIN {
    # Initialize the factorial array with the value 1 (1!)
    digits[1] = 1
    num_digits = 1

    # Compute 100!
    for (n = 2; n <= 100; n++) {
        carry = 0

        # Multiply each digit by n
        for (i = 1; i <= num_digits; i++) {
            product = digits[i] * n + carry
            digits[i] = product % 10
            carry = int(product / 10)
        }

        # Handle remaining carry
        while (carry > 0) {
            num_digits++
            digits[num_digits] = carry % 10
            carry = int(carry / 10)
        }
    }

    # Sum the digits of 100!
    sum = 0
    for (i = 1; i <= num_digits; i++) {
        sum += digits[i]
    }

    # Print the result
    print sum
}