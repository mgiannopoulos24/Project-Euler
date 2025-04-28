BEGIN {
    # Define the limit
    LIMIT = 2000000

    # Initialize an array to track prime numbers
    for (i = 0; i < LIMIT; i++) {
        is_prime[i] = 1  # 1 represents true (prime), 0 represents false (not prime)
    }

    # Sieve of Eratosthenes algorithm
    for (p = 2; p * p < LIMIT; p++) {
        if (is_prime[p]) {
            for (multiple = p * p; multiple < LIMIT; multiple += p) {
                is_prime[multiple] = 0  # Mark multiples of p as not prime
            }
        }
    }

    # Sum up all prime numbers
    sum = 0
    for (p = 2; p < LIMIT; p++) {
        if (is_prime[p]) {
            sum += p
        }
    }

    # Print the result
    print "The sum of all primes below", LIMIT, "is", sum
}