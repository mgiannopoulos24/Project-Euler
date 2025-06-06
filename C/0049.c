#include <stdio.h>
#include <stdbool.h>
#include <string.h>

// Function to check if a number is prime
bool is_prime(int num) {
    if (num <= 1) return false;
    if (num == 2) return true;
    if (num % 2 == 0) return false;
    for (int i = 3; i * i <= num; i += 2) {
        if (num % i == 0) return false;
    }
    return true;
}

// Function to generate all 4-digit primes
void generate_primes(int primes[], int *count) {
    *count = 0;
    for (int i = 1000; i < 10000; i++) {
        if (is_prime(i)) {
            primes[(*count)++] = i;
        }
    }
}

// Function to check if two numbers are permutations of each other
bool are_permutations(int a, int b) {
    char str_a[5], str_b[5];
    sprintf(str_a, "%04d", a);
    sprintf(str_b, "%04d", b);
    int count_a[10] = {0}, count_b[10] = {0};
    for (int i = 0; i < 4; i++) {
        count_a[str_a[i] - '0']++;
        count_b[str_b[i] - '0']++;
    }
    for (int i = 0; i < 10; i++) {
        if (count_a[i] != count_b[i]) return false;
    }
    return true;
}

// Function to find the arithmetic sequence
void find_arithmetic_sequence() {
    int primes[10000]; // Array to store 4-digit primes
    int count = 0;

    // Generate all 4-digit primes
    generate_primes(primes, &count);

    // Iterate through pairs of primes
    for (int i = 0; i < count; i++) {
        for (int j = i + 1; j < count; j++) {
            int a = primes[i];
            int b = primes[j];

            // Check if a and b are permutations
            if (!are_permutations(a, b)) continue;

            // Calculate the common difference
            int d = b - a;

            // Calculate the third term
            int c = b + d;

            // Check if the third term is a 4-digit prime and a permutation of a and b
            if (c >= 1000 && c < 10000 && is_prime(c) && are_permutations(a, c)) {
                // Exclude the known sequence: 1487, 4817, 8147
                if (!(a == 1487 && b == 4817 && c == 8147)) {
                    // Concatenate the terms to form the 12-digit number
                    printf("The 12-digit number formed by concatenating the sequence is: %04d%04d%04d\n", a, b, c);
                    return;
                }
            }
        }
    }
}

int main() {
    find_arithmetic_sequence();
    return 0;
}