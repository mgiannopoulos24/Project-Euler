function sumPrimesBelow(limit: number): number {
    if (limit < 2) return 0;
    
    // Create and initialize the sieve array
    const sieve: boolean[] = [];
    for (let i = 0; i < limit; i++) {
        sieve.push(true);
    }
    sieve[0] = false;
    sieve[1] = false;
    
    // Apply the Sieve of Eratosthenes
    for (let i = 2; i * i < limit; i++) {
        if (sieve[i]) {
            for (let j = i * i; j < limit; j += i) {
                sieve[j] = false;
            }
        }
    }
    
    // Sum all primes
    let sum = 0;
    for (let i = 2; i < limit; i++) {
        if (sieve[i]) {
            sum += i;
        }
    }
    
    return sum;
}

const limit = 2_000_000;
const result = sumPrimesBelow(limit);
console.log(`The sum of all primes below ${limit} is: ${result}`);