#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include <string.h>

#define LIMIT 1000000

void sieveOfEratosthenes(bool isPrime[], int limit) {
    memset(isPrime, true, sizeof(bool) * (limit + 1));
    isPrime[0] = isPrime[1] = false;
    for (int p = 2; p * p <= limit; p++) {
        if (isPrime[p]) {
            for (int i = p * p; i <= limit; i += p) {
                isPrime[i] = false;
            }
        }
    }
}

int countDigits(int n) {
    if (n == 0) return 1;
    int count = 0;
    while (n > 0) {
        n /= 10;
        count++;
    }
    return count;
}

bool isCircularPrime(int n, bool isPrime[]) {
    int num = n;
    int digits = countDigits(num);
    int power = pow(10, digits - 1);
    
    for (int i = 0; i < digits; i++) {
        if (!isPrime[num]) {
            return false;
        }
        int firstDigit = num / power;
        num = (num % power) * 10 + firstDigit;
    }
    return true;
}

int main() {
    bool isPrime[LIMIT + 1];
    sieveOfEratosthenes(isPrime, LIMIT);
    
    int count = 0;
    for (int i = 2; i < LIMIT; i++) {
        if (isPrime[i] && isCircularPrime(i, isPrime)) {
            count++;
        }
    }
    
    printf("%d\n", count);
    return 0;
}