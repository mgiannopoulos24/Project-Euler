#include <stdio.h>

// Function to compute (base^exponent) % mod using modular exponentiation
long long mod_exp(long long base, long long exponent, long long mod) {
    long long result = 1;
    base = base % mod; // Ensure base is within mod

    while (exponent > 0) {
        // If exponent is odd, multiply base with result
        if (exponent & 1) {
            result = ((__int128)result * base) % mod; // Use __int128 to prevent overflow
        }

        // Exponent must be even now
        exponent >>= 1; // Divide exponent by 2
        base = ((__int128)base * base) % mod; // Square the base, ensuring no overflow
    }
    return result;
}

int main() {
    const long long MOD = 10000000000LL; // 10^10
    long long sum = 0;

    // Iterate from 1 to 1000
    for (long long n = 1; n <= 1000; n++) {
        // Compute n^n % MOD using modular exponentiation
        long long term = mod_exp(n, n, MOD);

        // Add the term to the sum, keeping it within MOD
        sum = (sum + term) % MOD;
    }

    // Output the result
    printf("The last ten digits of the series are: %010lld\n", sum);

    return 0;
}