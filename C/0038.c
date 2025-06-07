#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>

// Function to check if a number is pandigital (contains digits 1-9 exactly once)
bool is_pandigital(const char *number) {
    int count[10] = {0}; // Array to count occurrences of each digit

    // Iterate through each character in the string
    for (int i = 0; number[i] != '\0'; i++) {
        int digit = number[i] - '0'; // Convert character to integer
        if (digit < 1 || digit > 9 || count[digit] > 0) {
            return false; // Not pandigital if digit is out of range or repeated
        }
        count[digit]++;
    }

    // Check if all digits from 1 to 9 are present exactly once
    for (int i = 1; i <= 9; i++) {
        if (count[i] != 1) {
            return false;
        }
    }

    return true;
}

// Function to generate the concatenated product of x with (1, 2, ..., n)
char *concatenated_product(int x, int n) {
    static char result[100]; // Buffer to store the concatenated product
    result[0] = '\0'; // Initialize the buffer

    // Concatenate the products of x with 1, 2, ..., n
    for (int i = 1; i <= n; i++) {
        char temp[20]; // Temporary buffer for each product
        sprintf(temp, "%d", x * i);
        strcat(result, temp); // Append the product to the result
    }

    return result;
}

int main() {
    int max_pandigital = 0; // To store the largest pandigital number found

    // Iterate over possible values of x
    for (int x = 1; x < 10000; x++) {
        int n = 2; // Start with n = 2 (since n > 1)

        while (true) {
            char *product = concatenated_product(x, n);
            int length = strlen(product);

            // Check if the concatenated product is a 9-digit number
            if (length == 9) {
                // Check if it is pandigital
                if (is_pandigital(product)) {
                    int value = atoi(product); // Convert the string to an integer
                    if (value > max_pandigital) {
                        max_pandigital = value; // Update the maximum pandigital number
                    }
                }
            }

            // If the concatenated product exceeds 9 digits, stop increasing n
            if (length >= 9) {
                break;
            }

            n++; // Increase n for the next iteration
        }
    }

    // Output the result
    printf("The largest 1-to-9 pandigital number is: %d\n", max_pandigital);

    return 0;
}