#include <stdio.h>
#include <string.h>

// Function to check if a string is 1-through-9 pandigital
int is_pandigital(const char *str) {
    int seen[10] = {0}; // Array to track seen digits (1-9)
    int len = strlen(str);

    // Check if the string has exactly 9 characters
    if (len != 9) {
        return 0;
    }

    // Check each character
    for (int i = 0; i < len; i++) {
        int digit = str[i] - '0'; // Convert char to int
        if (digit < 1 || digit > 9 || seen[digit]) {
            return 0; // Invalid digit or repeated digit
        }
        seen[digit] = 1; // Mark digit as seen
    }

    // All digits from 1 to 9 are present exactly once
    return 1;
}

int main() {
    int sum = 0;
    int products[10000] = {0}; // Array to store unique products
    int product_count = 0;

    // Iterate over possible multiplicands and multipliers
    for (int multiplicand = 1; multiplicand <= 9999; multiplicand++) {
        for (int multiplier = multiplicand; multiplier <= 9999; multiplier++) {
            long long product = (long long)multiplicand * multiplier;

            // Concatenate multiplicand, multiplier, and product into a single string
            char concat[20];
            snprintf(concat, sizeof(concat), "%d%d%lld", multiplicand, multiplier, product);

            // Check if the concatenated string is 1-through-9 pandigital
            if (is_pandigital(concat)) {
                // Store the product if it's not already in the list
                int found = 0;
                for (int i = 0; i < product_count; i++) {
                    if (products[i] == product) {
                        found = 1;
                        break;
                    }
                }
                if (!found) {
                    products[product_count++] = product;
                    sum += product;
                }
            }
        }
    }

    // Output the result
    printf("The sum of all unique pandigital products is: %d\n", sum);

    return 0;
}