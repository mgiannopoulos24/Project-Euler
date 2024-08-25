// Function to calculate the sum of multiples of 3 or 5 below a given limit
function sumOfMultiples(limit) {
    let sum = 0;
    for (let i = 1; i < limit; i++) {
        if (i % 3 === 0 || i % 5 === 0) {
            sum += i;
        }
    }
    return sum;
}

// Define the limit
const limit = 1000;

// Calculate and log the result
const result = sumOfMultiples(limit);
console.log(`The sum of all multiples of 3 or 5 below ${limit} is: ${result}`);
