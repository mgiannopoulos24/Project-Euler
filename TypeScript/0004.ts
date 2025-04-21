function isPalindrome(num: number): boolean {
    const str = num.toString();
    return str === str.split('').reverse().join('');
}

function largestPalindromeProduct(): number {
    let largestPalindrome = 0;

    // Iterate over all pairs of 3-digit numbers
    for (let a = 999; a >= 100; a--) {
        for (let b = a; b >= 100; b--) {
            const product = a * b;

            // If the product is smaller than the largest palindrome, break early
            if (product <= largestPalindrome) {
                break;
            }

            // Check if the product is a palindrome
            if (isPalindrome(product)) {
                largestPalindrome = product;
            }
        }
    }

    return largestPalindrome;
}

// Usage
console.log("The largest palindrome made from the product of two 3-digit numbers is:", largestPalindromeProduct());