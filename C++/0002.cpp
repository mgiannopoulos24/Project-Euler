#include <iostream>

int main() {
    // Initialize the first two terms of the Fibonacci sequence
    unsigned long long a = 1;
    unsigned long long b = 2;
    unsigned long long sum = 0;

    // Iterate until the terms exceed four million
    while (a <= 4000000) {
        // Check if the term is even
        if (a % 2 == 0) {
            sum += a;
        }

        // Generate the next Fibonacci number
        unsigned long long next = a + b;
        a = b;
        b = next;
    }

    // Print the sum of the even-valued terms
    std::cout << "The sum of the even-valued terms is: " << sum << std::endl;

    return 0;
}
