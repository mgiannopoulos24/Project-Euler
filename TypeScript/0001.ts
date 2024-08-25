// Function to calculate the sum of multiples of 3 or 5 below a given limit
function sumOfMultiples(limit: number): number {
    let totalSum = 0;
    for (let i = 1; i < limit; i++) {
        if (i % 3 === 0 || i % 5 === 0) {
            totalSum += i;
        }
    }
    return totalSum;
}

// Define the limit
const limit: number = 1000;

// Calculate the result
const result: number = sumOfMultiples(limit);

// Print the result
console.log(`The sum of all multiples of 3 or 5 below ${limit} is: ${result}`);
