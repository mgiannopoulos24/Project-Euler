#include <stdio.h>
#include <stdbool.h>
#include <math.h>

// Function to check if a number is prime
bool is_prime(int n) {
    if (n <= 1) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;
    for (int i = 3; i <= sqrt(n); i += 2) {
        if (n % i == 0) return false;
    }
    return true;
}

// Function to check if a number is truncatable from the left
bool is_truncatable_left(int n) {
    int temp = n;
    int divisor = 1;
    
    // Calculate the divisor to remove the leftmost digit
    while (temp >= 10) {
        temp /= 10;
        divisor *= 10;
    }
    
    // Check all left truncations
    while (n > 0) {
        if (!is_prime(n)) return false;
        n %= divisor; // Remove the leftmost digit
        divisor /= 10;
    }
    return true;
}

// Function to check if a number is truncatable from the right
bool is_truncatable_right(int n) {
    // Check all right truncations
    while (n > 0) {
        if (!is_prime(n)) return false;
        n /= 10; // Remove the rightmost digit
    }
    return true;
}

// Function to check if a number is truncatable from both sides
bool is_truncatable(int n) {
    return is_truncatable_left(n) && is_truncatable_right(n);
}

int main() {
    int count = 0; 
    long long sum = 0; 

    // Start checking from 11 onwards (since 2, 3, 5, 7 are not considered)
    for (int n = 11; count < 11; n++) {
        if (is_prime(n) && is_truncatable(n)) {
            sum += n;
            count++;
        }
    }

    // Output the result
    printf("The sum of the only eleven truncatable primes is: %lld\n", sum);

    return 0;
}