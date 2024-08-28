#include <stdio.h>
#include <math.h>

// Result is the product of all prime factors of numbers 1 through 20,
// each raised to the highest power encountered within this range.

typedef struct factor {
    int number;
    int power;
} Factor;

int is_prime(int n) {
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return 0;
    }
    return 1;
}

int next_prime(int prime) {
    int n = prime + 1;
    while (!is_prime(n)) n++;
    return n;
}

long get_smallest_divisible_number() {
    Factor factors[10];    // no more than 10 distinct prime factors divide numbers from 1 to 20
    int size = 0;          // number of distinct prime factorss stored in factor array

    for (int i = 20; i >= 1; i--) {
        int n = i;
        for (int prime = 2; prime <= i; prime = next_prime(prime)) {
            int power = 0;
            while (n % prime == 0) {
                n /= prime;
                power++;
            }

            if (power == 0) continue;   // n is not divisible by prime

            // Check if prime is already in the factors array
            int j = 0;
            for (j = 0; j < size; j++) {
                if (factors[j].number == prime) break;
            }

            // Prime not found - add it to the array with the power seen here
            if (j == size) {
                factors[size].number = prime;
                factors[size].power = power;
                size++;
            } else {
                // Factor found - update its power with the maximum seen so far
                if (power > factors[j].power) {
                    factors[j].power = power;
                }
            }
        }
    }    

    // Generate result by multiplying all prime factors raised to their maximum power
    long result = 1;
    for (int i = 0; i < size; i++) {
        result *= pow(factors[i].number, factors[i].power);
    }
    return result;
}

int main() {
    long int result = get_smallest_divisible_number();
    printf("%ld\n", result);
    return 0;
}