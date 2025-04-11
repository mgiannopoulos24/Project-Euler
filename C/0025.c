#include <stdio.h>
#include <math.h>

// Function to calculate the index of the first Fibonacci number with 1000 digits
int find_fibonacci_index_with_1000_digits() {
    // Constants
    double phi = (1 + sqrt(5)) / 2; // Golden ratio
    double log_phi = log10(phi);    // Logarithm base 10 of phi
    double log_sqrt_5 = log10(sqrt(5)); // Logarithm base 10 of sqrt(5)

    // Calculate the minimum n such that F_n has 1000 digits
    int n = (int)(ceil((999 + log_sqrt_5) / log_phi));

    return n;
}

int main() {
    int index = find_fibonacci_index_with_1000_digits();
    printf("The index of the first Fibonacci term to contain 1000 digits is: %d\n", index);
    return 0;
}