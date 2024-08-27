#include <stdio.h>

// Function to find the largest prime factor
long largest_prime_factor(long n) {
    long largest = 0;
    
    // Remove all factors of 2
    while (n % 2 == 0) {
        largest = 2;
        n /= 2;
    }
    
    // Remove all factors of odd numbers
    for (long i = 3; i * i <= n; i += 2) {
        while (n % i == 0) {
            largest = i;
            n /= i;
        }
    }
    
    // If n is a prime number greater than 2
    if (n > 2) {
        largest = n;
    }
    
    return largest;
}

int main() {
    long number = 600851475143;
    long result = largest_prime_factor(number);
    
    printf("The largest prime factor of %ld is %ld\n", number, result);
    
    return 0;
}
