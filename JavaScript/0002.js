function sumEvenFibonacci(maxVal) {
    let term1 = 1;
    let term2 = 2;
    let sumEven = 0;

    while (term1 <= maxVal) {
        // Check if the current term is even
        if (term1 % 2 === 0) {
            sumEven += term1;
        }

        // Generate the next term in the Fibonacci sequence
        let nextTerm = term1 + term2;
        term1 = term2;
        term2 = nextTerm;
    }

    return sumEven;
}

// Define the maximum value
const MAX_VALUE = 4000000;

// Calculate the sum of even Fibonacci terms
const result = sumEvenFibonacci(MAX_VALUE);

// Output the result
console.log("Sum of the even-valued terms:", result);
