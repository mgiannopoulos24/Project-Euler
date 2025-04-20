#include <iostream>
#include <algorithm>

// Function to check if a number is a palindrome
bool isPalindrome(int num) {
    int original = num;
    int reversed = 0;
    while (num > 0) {
        reversed = reversed * 10 + (num % 10);
        num /= 10;
    }
    return original == reversed;
}

int main() {
    int largestPalindrome = 0;

    // Iterate over all pairs of 3-digit numbers
    for (int i = 999; i >= 100; --i) {
        for (int j = i; j >= 100; --j) { // Start j from i to avoid duplicate checks
            int product = i * j;

            // If the product is smaller than the largest palindrome found, skip
            if (product <= largestPalindrome) {
                break;
            }

            // Check if the product is a palindrome
            if (isPalindrome(product)) {
                largestPalindrome = product;
            }
        }
    }

    std::cout << "The largest palindrome made from the product of two 3-digit numbers is: " << largestPalindrome << std::endl;
    return 0;
}