function isPrime(num: number, primes: number[]): boolean {
    const sqrt = Math.sqrt(num);
    for (const prime of primes) {
        if (prime > sqrt) break; // No need to check beyond sqrt(num)
        if (num % prime === 0) return false;
    }
    return true;
}

function nthPrime(n: number): number {
    if (n === 1) return 2; // The first prime is 2

    const primes: number[] = [2]; // List to store primes
    let candidate = 3; // Start checking from 3

    while (primes.length < n) {
        if (isPrime(candidate, primes)) {
            primes.push(candidate); // Add prime to the list
        }
        candidate += 2; // Increment by 2 to check only odd numbers
    }

    return primes[n - 1]; // Return the nth prime
}

// Usage
const n = 10001;
console.log(`The ${n}st prime number is:`, nthPrime(n));