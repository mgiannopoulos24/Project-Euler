function sumEvenFibonacci(limit: number): number {
    let a = 1;
    let b = 2;
    let evenSum = 0;

    while (a <= limit) {
        if (a % 2 === 0) {
            evenSum += a;
        }
        const next = a + b;
        a = b;
        b = next;
    }

    return evenSum;
}

// Define the limit (4 million)
const limit = 4000000;

// Calculate the sum of even-valued Fibonacci numbers
const result = sumEvenFibonacci(limit);

// Print the result
console.log(`The sum of the even-valued terms is: ${result}`);
