#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h> // For malloc and free

// Function to compute the sum of proper divisors of n
int sum_of_proper_divisors(int n) {
    int sum = 1; // 1 is always a proper divisor
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) {
            sum += i;
            if (i != n / i) { // Add the quotient if it's different from i
                sum += n / i;
            }
        }
    }
    return sum;
}

int main() {
    const int limit = 28123;

    // Dynamically allocate memory for arrays
    bool *is_abundant = (bool *)malloc((limit + 1) * sizeof(bool));
    bool *can_be_written_as_sum = (bool *)malloc((limit + 1) * sizeof(bool));

    // Initialize arrays
    for (int i = 0; i <= limit; i++) {
        is_abundant[i] = false;
        can_be_written_as_sum[i] = false;
    }

    // Step 1: Identify all abundant numbers up to limit
    for (int i = 1; i <= limit; i++) {
        if (sum_of_proper_divisors(i) > i) {
            is_abundant[i] = true;
        }
    }

    // Step 2: Generate all possible sums of two abundant numbers
    for (int i = 1; i <= limit; i++) {
        if (is_abundant[i]) {
            for (int j = i; j <= limit; j++) { // Start from i to avoid duplicates
                if (is_abundant[j]) {
                    int sum = i + j;
                    if (sum <= limit) {
                        can_be_written_as_sum[sum] = true;
                    }
                }
            }
        }
    }

    // Step 3: Sum all numbers that cannot be written as the sum of two abundant numbers
    long long total_sum = 0;
    for (int i = 1; i <= limit; i++) {
        if (!can_be_written_as_sum[i]) {
            total_sum += i;
        }
    }

    printf("The sum of all positive integers which cannot be written as the sum of two abundant numbers is: %lld\n", total_sum);

    // Free dynamically allocated memory
    free(is_abundant);
    free(can_be_written_as_sum);

    return 0;
}