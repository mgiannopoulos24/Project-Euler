#include <stdio.h>

// Function to compute the factorial of a digit
int factorial(int n) {
    if (n == 0 || n == 1) {
        return 1;
    }
    int result = 1;
    for (int i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}

// Function to calculate the sum of the factorials of the digits of a number
int sum_of_factorials(int number) {
    int sum = 0;
    while (number > 0) {
        int digit = number % 10; // Extract the last digit
        sum += factorial(digit); // Add the factorial of the digit
        number /= 10;           // Remove the last digit
    }
    return sum;
}

int main() {
    // Precompute factorials of digits 0-9
    int fact[10];
    for (int i = 0; i <= 9; i++) {
        fact[i] = factorial(i);
    }

    int sum_of_curious_numbers = 0;

    // Iterate over possible numbers
    for (int number = 3; number < 1000000; number++) { // Start from 3 to exclude trivial cases
        if (number == sum_of_factorials(number)) {
            sum_of_curious_numbers += number;
        }
    }

    // Output the result
    printf("The sum of all curious numbers is: %d\n", sum_of_curious_numbers);

    return 0;
}