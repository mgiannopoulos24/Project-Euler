#include <stdio.h>
#include <stdbool.h>
#include <math.h>

// Function to check if a number is prime
bool is_prime(int num) {
    if (num <= 1) return false;
    if (num == 2) return true;
    if (num % 2 == 0) return false;
    for (int i = 3; i * i <= num; i += 2) {
        if (num % i == 0) return false;
    }
    return true;
}

// Function to find the smallest odd composite number that cannot be written as p + 2n^2
void find_smallest_counterexample() {
    int C = 9; // Start with the smallest odd composite number

    while (true) {
        // Skip if C is prime
        if (is_prime(C)) {
            C += 2; // Move to the next odd number
            continue;
        }

        // Check if C can be written as p + 2n^2
        bool can_be_expressed = false;
        for (int p = 2; p <= C; p++) {
            if (is_prime(p)) {
                int remainder = C - p;
                if (remainder % 2 == 0) { // Check if remainder is even
                    int n_squared = remainder / 2;
                    int n = (int)sqrt(n_squared);
                    if (n * n == n_squared) {
                        can_be_expressed = true;
                        break;
                    }
                }
            }
        }

        // If C cannot be expressed, it is the counterexample
        if (!can_be_expressed) {
            printf("The smallest odd composite number that cannot be written as the sum of a prime and twice a square is: %d\n", C);
            break;
        }

        // Move to the next odd composite number
        C += 2;
    }
}

int main() {
    find_smallest_counterexample();
    return 0;
}