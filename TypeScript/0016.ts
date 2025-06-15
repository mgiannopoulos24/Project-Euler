function sumOfDigits(base: bigint, exponent: bigint): number {
    // Compute 2^1000 using BigInt
    const bigNumber = base ** exponent;

    // Convert the number to a string
    const numberString = bigNumber.toString();

    // Sum the digits
    let sum = 0;
    for (const char of numberString) {
        sum += parseInt(char, 10); // Convert each character to a number and add to the sum
    }

    return sum;
}


  const base = 2n; // Base as a BigInt
  const exponent = 1000n; // Exponent as a BigInt

  const result = sumOfDigits(base, exponent);
  console.log(`The sum of the digits of 2^1000 is: ${result}`);
