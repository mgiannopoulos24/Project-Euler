#include <stdio.h>

// Function to compute factorial
unsigned long long factorial(int n) {
    unsigned long long result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

// Function to compute binomial coefficient C(n, k)
unsigned long long binomial_coefficient(int n, int k) {
    if (k > n - k) {
        k = n - k; // Take advantage of symmetry
    }
    unsigned long long result = 1;
    for (int i = 0; i < k; i++) {
        result *= (n - i);
        result /= (i + 1);
    }
    return result;
}

int main() {
    int n = 40;
    int k = 20;

    // Calculate binomial coefficient C(40, 20)
    unsigned long long result = binomial_coefficient(n, k);

    // Print the result
    printf("The number of routes through a 20x20 grid is: %llu\n", result);

    return 0;
}
