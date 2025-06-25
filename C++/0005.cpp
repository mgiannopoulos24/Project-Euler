#include <iostream>
#include <cmath>
using namespace std;

// Result is the product of all prime factors of numbers 1 through 20,
// each raised to the highest power encountered within this range.

struct Factor {
    int number;
    int power;
};

bool is_prime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}

int next_prime(int prime) {
    int n = prime + 1;
    while (!is_prime(n)) n++;
    return n;
}

long get_smallest_divisible_number() {
    Factor factors[10];   // No more than 10 distinct prime factors under 20
    int size = 0;         // Number of distinct prime factors stored

    for (int i = 20; i >= 1; i--) {
        int n = i;
        for (int prime = 2; prime <= i; prime = next_prime(prime)) {
            int power = 0;
            while (n % prime == 0) {
                n /= prime;
                power++;
            }

            if (power == 0) continue;

            // Check if prime is already in the array
            int j = 0;
            while (j < size && factors[j].number != prime) {
                j++;
            }

            if (j == size) {
                // Prime not found, add it
                factors[size].number = prime;
                factors[size].power = power;
                size++;
            } else {
                // Update power if necessary
                if (power > factors[j].power) {
                    factors[j].power = power;
                }
            }
        }
    }

    // Calculate final result
    long result = 1;
    for (int i = 0; i < size; i++) {
        result *= static_cast<long>(pow(factors[i].number, factors[i].power));
    }

    return result;
}

int main() {
    long result = get_smallest_divisible_number();
    cout << result << endl;
    return 0;
}