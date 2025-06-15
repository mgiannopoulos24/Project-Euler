// Function to get the number of letters in the word representation of a number
function countLetters(n: number): number {
    // Predefined mappings for numbers and their letter counts
    const ones = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
    const teens = [
        "ten",
        "eleven",
        "twelve",
        "thirteen",
        "fourteen",
        "fifteen",
        "sixteen",
        "seventeen",
        "eighteen",
        "nineteen",
    ];
    const tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"];

    let letters = 0;

    if (n === 1000) {
        // Special case for "one thousand"
        letters += "onethousand".length;
    } else {
        const hundredsDigit = Math.floor(n / 100); // Hundreds place
        const remainder = n % 100; // Remaining two digits

        if (hundredsDigit > 0) {
            // Add letters for "X hundred"
            letters += ones[hundredsDigit].length + "hundred".length;

            if (remainder > 0) {
                // Add "and" if there's a remainder
                letters += "and".length;
            }
        }

        if (remainder > 0) {
            if (remainder < 10) {
                // Single-digit number
                letters += ones[remainder].length;
            } else if (remainder < 20) {
                // Teen numbers
                letters += teens[remainder - 10].length;
            } else {
                // Two-digit number (e.g., "twenty-one")
                const tensDigit = Math.floor(remainder / 10);
                const onesDigit = remainder % 10;
                letters += tens[tensDigit].length + ones[onesDigit].length;
            }
        }
    }

    return letters;
}

// Main function to calculate the total number of letters from 1 to 1000

let totalLetters = 0;

for (let i = 1; i <= 1000; i++) {
    totalLetters += countLetters(i);
}

console.log(`The total number of letters used is: ${totalLetters}`);


