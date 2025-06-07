#include <stdio.h>
#include <math.h>

// Function to check if a number is pentagonal
int is_pentagonal(long long x) {
    // Formula to check if x is pentagonal: (sqrt(24*x + 1) + 1) / 6 should be an integer
    double result = (sqrt(24 * x + 1) + 1) / 6;
    return floor(result) == result;
}

// Function to check if a number is hexagonal
int is_hexagonal(long long x) {
    // Formula to check if x is hexagonal: (sqrt(8*x + 1) + 1) / 4 should be an integer
    double result = (sqrt(8 * x + 1) + 1) / 4;
    return floor(result) == result;
}

// Function to find the next triangle number that is also pentagonal and hexagonal
void find_next_number() {
    long long m = 286; // Start from the next triangle number after T_285
    long long T_m;

    while (1) {
        // Calculate the current triangle number
        T_m = m * (m + 1) / 2;

        // Check if T_m is pentagonal
        if (is_pentagonal(T_m)) {
            // Check if T_m is hexagonal
            if (is_hexagonal(T_m)) {
                printf("The next triangle number that is also pentagonal and hexagonal is: %lld\n", T_m);
                break;
            }
        }

        // Move to the next triangle number
        m++;
    }
}

int main() {
    find_next_number();
    return 0;
}