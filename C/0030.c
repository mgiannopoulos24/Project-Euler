#include <stdio.h>
#include <math.h>

#define MAX_DIGIT 9
#define POWER 5
#define MAX_RANGE 354294  // Upper bound as derived from analysis

// Function to calculate the power of a digit
int power(int base, int exp) {
    int result = 1;
    for (int i = 0; i < exp; i++) {
        result *= base;
    }
    return result;
}

int main() {
    int fifth_powers[MAX_DIGIT + 1];
    int sum = 0;
    
    // Precompute fifth powers of digits 0 to 9
    for (int i = 0; i <= MAX_DIGIT; i++) {
        fifth_powers[i] = power(i, POWER);
    }
    
    // Iterate over all numbers from 10 to MAX_RANGE
    for (int num = 10; num <= MAX_RANGE; num++) {
        int original_num = num;
        int sum_of_powers = 0;
        
        // Calculate sum of fifth powers of digits
        while (original_num > 0) {
            int digit = original_num % 10;
            sum_of_powers += fifth_powers[digit];
            original_num /= 10;
        }
        
        // Check if the number equals the sum of the fifth powers of its digits
        if (sum_of_powers == num) {
            sum += num;
        }
    }
    
    // Output the result
    printf("The sum of all numbers that can be written as the sum of fifth powers of their digits is: %d\n", sum);
    
    return 0;
}
