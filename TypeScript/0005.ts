function gcd(a: number, b: number): number {
    // Compute the greatest common divisor using the Euclidean algorithm
    while (b !== 0) {
        [a, b] = [b, a % b];
    }
    return a;
}

function lcm(a: number, b: number): number {
    // Compute the least common multiple using the GCD
    return (a * b) / gcd(a, b);
}

function smallestMultiple(n: number): number {
    let result = 1;

    // Compute the LCM of all numbers from 1 to n
    for (let i = 2; i <= n; i++) {
        result = lcm(result, i);
    }

    return result;
}

// Usage
const n = 20;
console.log(`The smallest positive number divisible by all numbers from 1 to ${n} is:`, smallestMultiple(n));