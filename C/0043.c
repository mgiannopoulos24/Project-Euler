#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
int next_permutation(char *digits);

// Function to check if a number is divisible by a given divisor
int is_divisible(int num, int divisor) {
    return num % divisor == 0;
}

// Function to generate all permutations of the digits and check the conditions
void find_pandigital_numbers() {
    char digits[] = "0123456789"; // Digits to permute
    long long sum = 0;            // To store the sum of valid pandigital numbers

    // Generate all permutations of the digits
    do {
        // Extract substrings and check divisibility conditions
        int d2d3d4 = (digits[1] - '0') * 100 + (digits[2] - '0') * 10 + (digits[3] - '0');
        int d3d4d5 = (digits[2] - '0') * 100 + (digits[3] - '0') * 10 + (digits[4] - '0');
        int d4d5d6 = (digits[3] - '0') * 100 + (digits[4] - '0') * 10 + (digits[5] - '0');
        int d5d6d7 = (digits[4] - '0') * 100 + (digits[5] - '0') * 10 + (digits[6] - '0');
        int d6d7d8 = (digits[5] - '0') * 100 + (digits[6] - '0') * 10 + (digits[7] - '0');
        int d7d8d9 = (digits[6] - '0') * 100 + (digits[7] - '0') * 10 + (digits[8] - '0');
        int d8d9d10 = (digits[7] - '0') * 100 + (digits[8] - '0') * 10 + (digits[9] - '0');

        // Check divisibility conditions
        if (
            is_divisible(d2d3d4, 2) &&
            is_divisible(d3d4d5, 3) &&
            is_divisible(d4d5d6, 5) &&
            is_divisible(d5d6d7, 7) &&
            is_divisible(d6d7d8, 11) &&
            is_divisible(d7d8d9, 13) &&
            is_divisible(d8d9d10, 17)
        ) {
            // Convert the permutation to a number and add to the sum
            long long number = 0;
            for (int i = 0; i < 10; i++) {
                number = number * 10 + (digits[i] - '0');
            }
            sum += number;
        }
    } while (next_permutation(digits));

    // Output the sum of all valid pandigital numbers
    printf("The sum of all 0-to-9 pandigital numbers with the property is: %lld\n", sum);
}

// Function to generate the next permutation of a string
int next_permutation(char *digits) {
    int n = strlen(digits);
    int i, j;

    // Step 1: Find the first decreasing element from the right
    for (i = n - 2; i >= 0; i--) {
        if (digits[i] < digits[i + 1]) {
            break;
        }
    }

    // If no such element is found, all permutations are generated
    if (i < 0) {
        return 0;
    }

    // Step 2: Find the smallest element to the right of 'i' that is greater than digits[i]
    for (j = n - 1; j > i; j--) {
        if (digits[j] > digits[i]) {
            break;
        }
    }

    // Step 3: Swap digits[i] and digits[j]
    char temp = digits[i];
    digits[i] = digits[j];
    digits[j] = temp;

    // Step 4: Reverse the suffix starting at position i + 1
    int left = i + 1;
    int right = n - 1;
    while (left < right) {
        temp = digits[left];
        digits[left] = digits[right];
        digits[right] = temp;
        left++;
        right--;
    }

    return 1;
}

int main() {
    find_pandigital_numbers();
    return 0;
}