#include <stdio.h>

int main() {
    // Initialize the first two terms of the Fibonacci sequence
    unsigned long long int a = 1, b = 2;
    unsigned long long int sum = 0;

    // Iterate until the terms exceed four million
    while (a <= 4000000) {
        // Check if the term is even
        if (a % 2 == 0) {
            sum += a;
        }
        
        // Generate the next Fibonacci number
        unsigned long long int next = a + b;
        a = b;
        b = next;
    }

    // Print the sum of the even-valued terms
    printf("The sum of the even-valued terms is: %llu\n", sum);

    return 0;
}
