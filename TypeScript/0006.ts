function differenceSumOfSquaresAndSquareOfSum(n: number): number {
    // Compute the sum of squares using the formula
    const sumOfSquares = (n * (n + 1) * (2 * n + 1)) / 6;

    // Compute the square of the sum using the formula
    const sum = (n * (n + 1)) / 2;
    const squareOfSum = sum * sum;

    // Compute the difference
    const difference = squareOfSum - sumOfSquares;

    return difference;
}

// Usage
const n = 100;
console.log(`The difference between the sum of the squares and the square of the sum for the first ${n} natural numbers is:`, differenceSumOfSquaresAndSquareOfSum(n));