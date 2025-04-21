void main() {
  int largestPalindrome = 0;

  // Iterate over all pairs of 3-digit numbers
  for (int i = 999; i >= 100; i--) { // Start from 999 and decrement to 100
    for (int j = i; j >= 100; j--) { // Ensure j <= i to avoid redundant calculations
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

  print("The largest palindrome made from the product of two 3-digit numbers is: $largestPalindrome");
}

// Function to check if a number is a palindrome
bool isPalindrome(int num) {
  String str = num.toString();
  return str == str.split('').reversed.join('');
}