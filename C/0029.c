#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

#define MAX_BASE 100
#define MAX_EXP 100

// Function to check if a number is a perfect power (can be written as m^k where k > 1)
bool isPerfectPower(int n) {
    if (n == 1) return false;
    int max_k = log(n) / log(2) + 1; // Maximum possible k (since 2^k <= n)
    for (int k = 2; k <= max_k; k++) {
        double m = pow(n, 1.0 / k);
        int m_rounded = round(m);
        // Check if m_rounded^k is equal to n, considering floating point inaccuracies
        if (pow(m_rounded, k) == n) {
            return true;
        }
    }
    return false;
}

int main() {
    bool *is_base = (bool *)malloc((MAX_BASE + 1) * sizeof(bool));
    for (int i = 2; i <= MAX_BASE; i++) {
        is_base[i] = !isPerfectPower(i);
    }

    int **exponents = (int **)malloc((MAX_BASE + 1) * sizeof(int *));
    for (int i = 0; i <= MAX_BASE; i++) {
        exponents[i] = (int *)calloc(MAX_EXP + 1, sizeof(int));
    }

    int total_distinct = 0;

    for (int m = 2; m <= MAX_BASE; m++) {
        if (is_base[m]) {
            int max_k = 1;
            while ((int)pow(m, max_k) <= MAX_BASE) {
                max_k++;
            }
            max_k--;

            bool *seen = (bool *)calloc(MAX_BASE * MAX_EXP + 1, sizeof(bool));
            int count = 0;

            for (int k = 1; k <= max_k; k++) {
                for (int b = 2; b <= MAX_EXP; b++) {
                    int exponent = k * b;
                    if (!seen[exponent]) {
                        seen[exponent] = true;
                        count++;
                    }
                }
            }
            total_distinct += count;
            free(seen);
        }
    }

    printf("%d\n", total_distinct);

    for (int i = 0; i <= MAX_BASE; i++) {
        free(exponents[i]);
    }
    free(exponents);
    free(is_base);

    return 0;
}