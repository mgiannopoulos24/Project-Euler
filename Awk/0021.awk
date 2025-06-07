BEGIN {
    # Define the upper limit
    limit = 10000

    # Array to store the sum of proper divisors for each number
    for (n = 1; n < limit; n++) {
        sum_divisors[n] = 0
    }

    # Compute the sum of proper divisors for all numbers up to limit
    for (n = 1; n < limit; n++) {
        for (i = 1; i <= n / 2; i++) {
            if (n % i == 0) {
                sum_divisors[n] += i
            }
        }
    }

    # Find amicable pairs and compute their sum
    total_sum = 0
    for (a = 1; a < limit; a++) {
        b = sum_divisors[a]
        if (b > a && b < limit && sum_divisors[b] == a) {
            total_sum += a + b
        }
    }

    # Print the result
    print total_sum
}