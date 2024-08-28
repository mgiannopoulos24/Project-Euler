#include <stdio.h>
#include <stdbool.h>

#define LIMIT 2000000

// Function to calculate the sum of all primes below the given limit
unsigned long long sum_of_primes_below(unsigned int limit) {
    bool is_prime[LIMIT];
    unsigned long long sum = 0;

    // Initialize all entries to true
    for (int i = 0; i < LIMIT; i++) {
        is_prime[i] = true;
    }

    // Sieve of Eratosthenes algorithm
    for (int p = 2; p * p < LIMIT; p++) {
        if (is_prime[p]) {
            for (int multiple = p * p; multiple < LIMIT; multiple += p) {
                is_prime[multiple] = false;
            }
        }
    }

    // Sum up all prime numbers
    for (int p = 2; p < LIMIT; p++) {
        if (is_prime[p]) {
            sum += p;
        }
    }

    return sum;
}

int main() {
    unsigned long long sum = sum_of_primes_below(LIMIT);
    printf("The sum of all primes below %d is %llu\n", LIMIT, sum);
    return 0;
}
