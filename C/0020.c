#include <stdio.h>
#include <string.h>

// Function to multiply a large number by an integer
void multiply(int result[], int *size, int n) {
    int carry = 0;

    // Multiply each digit of the number by n and handle carry
    for (int i = 0; i < *size; i++) {
        int product = result[i] * n + carry;
        result[i] = product % 10;  // Store last digit of product in result
        carry = product / 10;      // Carry is the rest
    }

    // Handle remaining carry
    while (carry) {
        result[(*size)++] = carry % 10;
        carry /= 10;
    }
}

// Function to calculate the factorial and sum the digits
int sum_of_digits_in_factorial(int n) {
    int result[500]; // Array to store the digits of the factorial
    result[0] = 1;   // Initial factorial value for 0! or 1!
    int size = 1;    // Size of the number in the result array

    // Compute factorial
    for (int i = 2; i <= n; i++) {
        multiply(result, &size, i);
    }

    // Calculate the sum of the digits
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += result[i];
    }

    return sum;
}

int main() {
    int n = 100;
    int result = sum_of_digits_in_factorial(n);
    printf("The sum of the digits in the number %d! is: %d\n", n, result);
    return 0;
}
