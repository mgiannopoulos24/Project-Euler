function largestPrimeFactor(n: number): number {
    let largestFactor = 0;

    // Step 1: Remove all factors of 2
    while (n % 2 === 0) {
        largestFactor = 2;
        n /= 2;
    }

    // Step 2: Check odd factors from 3 to sqrt(n)
    let factor = 3;
    while (factor * factor <= n) {
        while (n % factor === 0) {
            largestFactor = factor;
            n /= factor;
        }
        factor += 2; // Increment by 2 to skip even numbers
    }

    // Step 3: If n is still greater than 1, it must be a prime number
    if (n > 1) {
        largestFactor = n;
    }

    return largestFactor;
}

// Usage
const number = 600851475143;
console.log(`The largest prime factor of ${number} is:`, largestPrimeFactor(number));