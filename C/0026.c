#include <stdio.h>
#include <math.h>

// Function to compute gcd using Euclidean algorithm
int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

// Function to compute the order of 10 modulo d
int find_order(int d) {
    if (gcd(10, d) != 1) return 0; // Not coprime, no recurring cycle

    int k = 1;
    long long power = 10 % d; // Start with 10 mod d

    while (power != 1) {
        power = (power * 10) % d;
        k++;
    }

    return k;
}

int main() {
    int max_cycle_length = 0;
    int result_d = 0;

    // Iterate over all d from 2 to 999
    for (int d = 2; d < 1000; d++) {
        int cycle_length = find_order(d);

        // Update the maximum cycle length and corresponding d
        if (cycle_length > max_cycle_length) {
            max_cycle_length = cycle_length;
            result_d = d;
        }
    }

    printf("The value of d < 1000 for which 1/d contains the longest recurring cycle is: %d\n", result_d);
    return 0;
}