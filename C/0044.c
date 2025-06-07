#include <stdio.h>
#include <math.h>
#include <limits.h>

// Function to check if a number is pentagonal
int is_pentagonal(long long x) {
    // Formula to check if x is pentagonal: (sqrt(24*x + 1) + 1) / 6 should be an integer
    double result = (sqrt(24 * x + 1) + 1) / 6;
    return floor(result) == result;
}

// Function to generate pentagonal numbers and find the desired pair
void find_minimized_D() {
    long long min_D = LLONG_MAX; // Initialize minimum D to a large value
    long long Pj, Pk, S, D;

    // Generate pentagonal numbers and store them
    long long pentagonals[10000]; // Array to store pentagonal numbers
    int count = 0;

    // Generate pentagonal numbers
    for (long long n = 1; n <= 10000; n++) {
        pentagonals[count++] = n * (3 * n - 1) / 2;
    }

    // Iterate through pairs of pentagonal numbers
    for (int j = 0; j < count; j++) {
        Pj = pentagonals[j];
        for (int k = j + 1; k < count; k++) {
            Pk = pentagonals[k];

            // Calculate sum and difference
            S = Pj + Pk;
            D = Pk - Pj;

            // Check if both sum and difference are pentagonal
            if (is_pentagonal(S) && is_pentagonal(D)) {
                // Update the minimum D if this pair gives a smaller D
                if (D < min_D) {
                    min_D = D;
                }
            }
        }
    }

    // Output the result
    printf("The minimized value of D is: %lld\n", min_D);
}

int main() {
    find_minimized_D();
    return 0;
}