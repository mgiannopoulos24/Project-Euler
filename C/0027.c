#include <stdio.h>
#include <stdbool.h>
#include <math.h>

// Function to check if a number is prime
bool is_prime(int n) {
    if (n <= 1) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;

    int sqrt_n = (int)sqrt(n);
    for (int i = 3; i <= sqrt_n; i += 2) {
        if (n % i == 0) return false;
    }
    return true;
}

// Function to find the maximum number of consecutive primes
void find_max_consecutive_primes() {
    int max_count = 0;
    int best_a = 0;
    int best_b = 0;

    // Precompute all prime numbers up to 1000
    bool is_prime_table[1001] = {false};
    for (int i = 2; i <= 1000; i++) {
        if (is_prime(i)) {
            is_prime_table[i] = true;
        }
    }

    // Iterate over all possible values of a and b
    for (int a = -999; a < 1000; a++) {
        for (int b = -1000; b <= 1000; b++) {
            if (!is_prime_table[b]) continue; // b must be prime

            int n = 0;
            while (true) {
                int value = n * n + a * n + b;
                if (value <= 0 || !is_prime(value)) break;
                n++;
            }

            if (n > max_count) {
                max_count = n;
                best_a = a;
                best_b = b;
            }
        }
    }

    printf("The coefficients (a, b) that produce the maximum number of consecutive primes are: (%d, %d)\n", best_a, best_b);
    printf("The product of the coefficients is: %d\n", best_a * best_b);
}

int main() {
    find_max_consecutive_primes();
    return 0;
}