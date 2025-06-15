function firstTriangleNumberWithDivisors(minDivisors: number): number {
    let n = 1;
    let triangleNumber = 1;

    while (true) {
        // Get the number of divisors for the current triangle number
        const divisors = countDivisors(triangleNumber);

        if (divisors > minDivisors) {
            return triangleNumber;
        }

        // Generate next triangle number
        n++;
        triangleNumber += n;
    }
}

function countDivisors(num: number): number {
    if (num === 1) return 1;

    let count = 1;
    let remaining = num;

    // Handle 2 separately
    if (remaining % 2 === 0) {
        let exponent = 0;
        while (remaining % 2 === 0) {
            remaining /= 2;
            exponent++;
        }
        count *= (exponent + 1);
    }

    // Check odd divisors up to sqrt(remaining)
    for (let i = 3; i <= Math.sqrt(remaining); i += 2) {
        if (remaining % i === 0) {
            let exponent = 0;
            while (remaining % i === 0) {
                remaining /= i;
                exponent++;
            }
            count *= (exponent + 1);
        }
    }

    // If remaining is a prime number greater than 2
    if (remaining > 2) {
        count *= 2;
    }

    return count;
}

const minDivisors = 500;
const result = firstTriangleNumberWithDivisors(minDivisors);
console.log(`The first triangle number with over ${minDivisors} divisors is: ${result}`);