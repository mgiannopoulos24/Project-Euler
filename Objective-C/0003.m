#import <Foundation/Foundation.h>
#import <math.h>

long long largestPrimeFactor(long long n) {
    long long maxPrime = -1;

    // Step 1: Remove all factors of 2
    while (n % 2 == 0) {
        maxPrime = 2;
        n /= 2;
    }

    // Step 2: Try odd factors from 3 upwards
    for (long long i = 3; i <= sqrt(n); i += 2) {
        while (n % i == 0) {
            maxPrime = i;
            n /= i;
        }
    }

    // Step 3: If n is now greater than 2, then it's a prime
    if (n > 2) {
        maxPrime = n;
    }

    return maxPrime;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        long long number = 600851475143;
        long long result = largestPrimeFactor(number);
        NSLog(@"The largest prime factor of %lld is %lld", number, result);
    }
    return 0;
}