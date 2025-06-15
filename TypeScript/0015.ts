// Function to compute factorial
function factorial(n: number): bigint {
    let result: bigint = 1n; // Use BigInt for large numbers
    for (let i = 1; i <= n; i++) {
        result *= BigInt(i); // Convert `i` to BigInt for multiplication
    }
    return result;
}

// Function to compute binomial coefficient C(n, k)
function binomialCoefficient(n: number, k: number): bigint {
    if (k > n - k) {
        k = n - k; // Take advantage of symmetry
    }
    let result: bigint = 1n;
    for (let i = 0; i < k; i++) {
        result *= BigInt(n - i); // Multiply by (n - i)
        result /= BigInt(i + 1); // Divide by (i + 1)
    }
    return result;
}


  const n = 40;
  const k = 20;

  // Calculate binomial coefficient C(40, 20)
  const result = binomialCoefficient(n, k);

  // Print the result
  console.log(`The number of routes through a 20x20 grid is: ${result.toString()}`);
