#include <stdio.h>

// Function to compute the sum of proper divisors of n
int sum_of_proper_divisors(int n) {
    int sum = 1; // 1 is always a proper divisor
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) {
            sum += i;
            if (i != n / i) { // Add the quotient if it's different from i
                sum += n / i;
            }
        }
    }
    return sum;
}

int main() {
    int limit = 10000;
    int sum_amicable = 0;

    // Array to store the sum of proper divisors for each number
    int d[limit + 1];
    for (int i = 1; i <= limit; i++) {
        d[i] = sum_of_proper_divisors(i);
    }

    // Find amicable pairs
    for (int a = 1; a <= limit; a++) {
        int b = d[a];
        if (b <= limit && b > a && d[b] == a) {
            sum_amicable += a + b;
        }
    }

    printf("The sum of all amicable numbers under 10000 is: %d\n", sum_amicable);
    return 0;
}