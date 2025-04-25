import std.stdio;
import std.conv : to;
import std.algorithm : reverse;

// Function to check if a number is a palindrome
bool isPalindrome(int num) {
    // Convert the number to a mutable array of characters
    auto str = num.to!string;
    auto reversedStr = str.dup; // Create a mutable copy of the string
    reversedStr.reverse();      // Reverse the mutable copy
    return str == reversedStr;  // Compare the original and reversed strings
}

void main() {
    int largestPalindrome = 0;

    // Iterate over all pairs of 3-digit numbers
    for (int i = 999; i >= 100; --i) { 
        for (int j = i; j >= 100; --j) { 
            int product = i * j;

            // If the product is smaller than the largest palindrome found, break
            if (product <= largestPalindrome) {
                break;
            }

            // Check if the product is a palindrome
            if (isPalindrome(product)) {
                largestPalindrome = product;
            }
        }
    }

    writeln("The largest palindrome made from the product of two 3-digit numbers is: ", largestPalindrome);
}