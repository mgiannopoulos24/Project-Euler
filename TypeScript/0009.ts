function findPythagoreanTripletProduct(sum: number): number {
    for (let a = 1; a < sum / 3; a++) {
        for (let b = a + 1; b < (sum - a) / 2; b++) {
            const c = sum - a - b;

            // Check if it's a Pythagorean triplet
            if (a * a + b * b === c * c) {
                return a * b * c; // Return the product of the triplet
            }
        }
    }

    return -1; // If no triplet is found
}

// Usage
const sum = 1000;
console.log(`The product of the Pythagorean triplet for which a + b + c = ${sum} is:`, findPythagoreanTripletProduct(sum));