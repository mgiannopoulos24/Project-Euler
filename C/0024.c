#include <stdio.h>

// Function to compute factorial
long long factorial(int n) {
    long long result = 1;
    for (int i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}

// Function to find the nth lexicographic permutation
void nth_permutation(long long n, int digits[], int size) {
    // Decrement n by 1 because permutations are 0-indexed
    n--;

    // Resultant permutation array
    int result[size];
    int remaining_digits[size];

    // Copy the digits array into remaining_digits
    for (int i = 0; i < size; i++) {
        remaining_digits[i] = digits[i];
    }

    // Build the permutation one digit at a time
    for (int i = 0; i < size; i++) {
        // Calculate the factorial of (size - i - 1)
        long long fact = factorial(size - i - 1);

        // Determine the index of the next digit
        int index = n / fact;

        // Select the digit at the calculated index
        result[i] = remaining_digits[index];

        // Remove the selected digit from the remaining digits
        for (int j = index; j < size - i - 1; j++) {
            remaining_digits[j] = remaining_digits[j + 1];
        }

        // Update n for the next iteration
        n %= fact;
    }

    // Print the resulting permutation
    for (int i = 0; i < size; i++) {
        printf("%d", result[i]);
    }
    printf("\n");
}

int main() {
    // Digits to permute
    int digits[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int size = sizeof(digits) / sizeof(digits[0]);

    // Target permutation (1,000,000th)
    long long n = 1000000;

    // Find and print the nth permutation
    nth_permutation(n, digits, size);

    return 0;
}