BEGIN {
    largest_palindrome = 0

    # Iterate through all pairs of 3-digit numbers
    for (i = 100; i <= 999; i++) {
        for (j = 100; j <= 999; j++) {
            product = i * j

            # Convert product to string
            str = product
            len = length(str)
            is_palindrome = 1

            # Check if the string is a palindrome
            for (k = 1; k <= len / 2; k++) {
                if (substr(str, k, 1) != substr(str, len - k + 1, 1)) {
                    is_palindrome = 0
                    break
                }
            }

            if (is_palindrome && product > largest_palindrome) {
                largest_palindrome = product
            }
        }
    }

    print largest_palindrome
}