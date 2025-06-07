#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to find the nth digit in the concatenated sequence of positive integers
int find_nth_digit(int n) {
    int digit_length = 1; // Current length of numbers being considered
    long long count = 9;  // Number of integers with the current digit length

    // Find the range where the nth digit lies
    while (n > digit_length * count) {
        n -= digit_length * count;
        digit_length++;
        count *= 10;
    }

    // Calculate the actual number containing the nth digit
    long long start = pow(10, digit_length - 1);
    long long number = start + (n - 1) / digit_length;

    // Find the specific digit within the number
    char num_str[20];
    sprintf(num_str, "%lld", number);
    int digit_index = (n - 1) % digit_length;
    return num_str[digit_index] - '0';
}

int main() {
    // Digits to find: d_1, d_10, d_100, d_1000, d_10000, d_100000, d_1000000
    int positions[] = {1, 10, 100, 1000, 10000, 100000, 1000000};
    int product = 1;

    // Compute the product of the required digits
    for (int i = 0; i < 7; i++) {
        int digit = find_nth_digit(positions[i]);
        printf("d_%d = %d\n", positions[i], digit);
        product *= digit;
    }

    // Output the final product
    printf("The product is: %d\n", product);

    return 0;
}