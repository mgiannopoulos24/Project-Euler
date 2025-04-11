#include <stdio.h>
#include <stdlib.h>

// Function to compute the greatest common divisor (GCD)
int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

// Function to simplify a fraction
void simplify_fraction(int *numerator, int *denominator) {
    int gcd_val = gcd(*numerator, *denominator);
    *numerator /= gcd_val;
    *denominator /= gcd_val;
}

// Function to check if a fraction is a curious fraction
int is_curious_fraction(int numerator, int denominator) {
    // Convert numerator and denominator to strings
    char num_str[3], den_str[3];
    sprintf(num_str, "%d", numerator);
    sprintf(den_str, "%d", denominator);

    // Extract digits
    int num1 = num_str[0] - '0';
    int num2 = num_str[1] - '0';
    int den1 = den_str[0] - '0';
    int den2 = den_str[1] - '0';

    // Check for non-trivial cancellations
    // Ensure no division by zero occurs
    if (num1 == den1 && num2 != 0 && den2 != 0 && (double)num2 / den2 == (double)numerator / denominator) {
        return 1;
    }
    if (num1 == den2 && num2 != 0 && den1 != 0 && (double)num2 / den1 == (double)numerator / denominator) {
        return 1;
    }
    if (num2 == den1 && num1 != 0 && den2 != 0 && (double)num1 / den2 == (double)numerator / denominator) {
        return 1;
    }
    if (num2 == den2 && num1 != 0 && den1 != 0 && (double)num1 / den1 == (double)numerator / denominator) {
        return 1;
    }

    return 0;
}

int main() {
    int curious_numerators[4] = {0};
    int curious_denominators[4] = {0};
    int count = 0;

    // Iterate over all two-digit numbers
    for (int numerator = 10; numerator < 100; numerator++) {
        for (int denominator = numerator + 1; denominator < 100; denominator++) {
            // Skip trivial cases (fractions with trailing zeros)
            if (numerator % 10 == 0 && denominator % 10 == 0) {
                continue;
            }

            // Check if the fraction is curious
            if (is_curious_fraction(numerator, denominator)) {
                curious_numerators[count] = numerator;
                curious_denominators[count] = denominator;
                count++;
                if (count == 4) {
                    break;
                }
            }
        }
        if (count == 4) {
            break;
        }
    }

    // Compute the product of the four fractions
    int product_numerator = 1;
    int product_denominator = 1;
    for (int i = 0; i < 4; i++) {
        product_numerator *= curious_numerators[i];
        product_denominator *= curious_denominators[i];
    }

    // Simplify the resulting fraction
    simplify_fraction(&product_numerator, &product_denominator);

    // Output the denominator of the simplified fraction
    printf("The value of the denominator is: %d\n", product_denominator);

    return 0;
}