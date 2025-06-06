#include <stdio.h>
#include <stdbool.h>

// Function to generate all primes below a given limit using the Sieve of Eratosthenes
void sieve_of_eratosthenes(int limit, bool *is_prime) {
    // Initialize all entries as true
    for (int i = 0; i <= limit; i++) {
        is_prime[i] = true;
    }
    is_prime[0] = false;
    is_prime[1] = false;

    for (int p = 2; p * p <= limit; p++) {
        if (is_prime[p]) {
            for (int multiple = p * p; multiple <= limit; multiple += p) {
                is_prime[multiple] = false;
            }
        }
    }
}

// Function to find the prime that can be written as the sum of the most consecutive primes
void find_longest_consecutive_primes_sum() {
    const int LIMIT = 1000000;
    bool is_prime[LIMIT + 1];
    sieve_of_eratosthenes(LIMIT, is_prime);

    // List of primes below one million
    int primes[100000]; // There are approximately 78,498 primes below one million
    int prime_count = 0;
    for (int i = 2; i <= LIMIT; i++) {
        if (is_prime[i]) {
            primes[prime_count++] = i;
        }
    }

    int max_length = 0;
    int result = 0;

    // Iterate over all possible starting points for the sequence of primes
    for (int start = 0; start < prime_count; start++) {
        long long sum = 0;
        int length = 0;

        // Compute the cumulative sum of consecutive primes
        for (int end = start; end < prime_count; end++) {
            sum += primes[end];
            length++;

            // If the sum exceeds the limit, break
            if (sum >= LIMIT) {
                break;
            }

            // Check if the sum is a prime number
            if (is_prime[sum]) {
                // Update the result if this is the longest sequence found so far
                if (length > max_length) {
                    max_length = length;
                    result = sum;
                }
            }
        }
    }

    printf("The prime below one million that can be written as the sum of the most consecutive primes is: %d\n", result);
}

int main() {
    find_longest_consecutive_primes_sum();
    return 0;
}