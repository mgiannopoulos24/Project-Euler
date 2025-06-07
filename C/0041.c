#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

// Function prototypes
int is_prime(int num);
int prev_permutation(char *digits);

// Function to check if a number is prime
int is_prime(int num) {
    if (num <= 1) return 0;
    if (num == 2) return 1;
    if (num % 2 == 0) return 0;

    int sqrt_num = (int)sqrt(num);
    for (int i = 3; i <= sqrt_num; i += 2) {
        if (num % i == 0) return 0;
    }
    return 1;
}

// Function to generate permutations and find the largest pandigital prime
void find_largest_pandigital_prime() {
    char digits[] = "7654321"; // Digits for 7-digit pandigital numbers
    int max_prime = 0;

    // Generate all permutations of the digits
    do {
        // Convert the permutation to an integer
        int number = atoi(digits);

        // Check if the number is prime
        if (is_prime(number)) {
            // Update the maximum prime found
            if (number > max_prime) {
                max_prime = number;
            }
        }
    } while (prev_permutation(digits));

    // Output the largest pandigital prime
    printf("The largest 7-digit pandigital prime is: %d\n", max_prime);
}

// Function to generate the previous permutation of a string
int prev_permutation(char *digits) {
    int n = strlen(digits);
    int i, j;

    // Step 1: Find the first decreasing element from the right
    for (i = n - 2; i >= 0; i--) {
        if (digits[i] > digits[i + 1]) {
            break;
        }
    }

    // If no such element is found, all permutations are generated
    if (i < 0) {
        return 0;
    }

    // Step 2: Find the largest element to the right of 'i' that is smaller than digits[i]
    for (j = n - 1; j > i; j--) {
        if (digits[j] < digits[i]) {
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
    find_largest_pandigital_prime();
    return 0;
}