BEGIN {
    # Define the upper limit
    limit = 28123

    # Step 1: Find all abundant numbers up to the limit
    for (n = 1; n <= limit; n++) {
        sum_divisors = 0
        for (i = 1; i * i <= n; i++) {
            if (n % i == 0) {
                sum_divisors += i
                if (i != n / i && i != 1) {
                    sum_divisors += n / i
                }
            }
        }
        if (sum_divisors > n) {
            abundant[++abundant_count] = n
        }
    }

    # Step 2: Mark numbers that can be written as the sum of two abundant numbers
    for (i = 1; i <= abundant_count; i++) {
        for (j = i; j <= abundant_count; j++) {
            sum = abundant[i] + abundant[j]
            if (sum <= limit) {
                is_sum_of_abundant[sum] = 1
            } else {
                break
            }
        }
    }

    # Step 3: Sum all numbers that cannot be written as the sum of two abundant numbers
    total_sum = 0
    for (n = 1; n <= limit; n++) {
        if (!is_sum_of_abundant[n]) {
            total_sum += n
        }
    }

    # Print the result
    print total_sum
}