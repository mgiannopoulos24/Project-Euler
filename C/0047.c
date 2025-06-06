#include <stdio.h>
#include <stdbool.h>
#include <math.h>

// Function to count the number of distinct prime factors of a number
int count_distinct_prime_factors(int num) {
    int count = 0;
    // Check divisibility by 2
    if (num % 2 == 0) {
        count++;
        while (num % 2 == 0) {
            num /= 2;
        }
    }
    // Check divisibility by odd numbers starting from 3
    for (int i = 3; i <= sqrt(num); i += 2) {
        if (num % i == 0) {
            count++;
            while (num % i == 0) {
                num /= i;
            }
        }
    }
    // If num is still greater than 1, it is a prime factor
    if (num > 1) {
        count++;
    }
    return count;
}

// Function to find the first four consecutive numbers with four distinct prime factors
void find_consecutive_numbers_with_four_prime_factors() {
    int n = 1; // Start checking from 1

    while (true) {
        // Check if the current number and the next three consecutive numbers have exactly 4 distinct prime factors
        if (
            count_distinct_prime_factors(n) == 4 &&
            count_distinct_prime_factors(n + 1) == 4 &&
            count_distinct_prime_factors(n + 2) == 4 &&
            count_distinct_prime_factors(n + 3) == 4
        ) {
            printf("The first four consecutive numbers with four distinct prime factors are:\n");
            printf("%d, %d, %d, %d\n", n, n + 1, n + 2, n + 3);
            printf("The first of these numbers is: %d\n", n);
            break;
        }
        n++;
    }
}

int main() {
    find_consecutive_numbers_with_four_prime_factors();
    return 0;
}