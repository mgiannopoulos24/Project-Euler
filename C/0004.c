#include <stdio.h>

int is_palindrome(int n) {
    // Since n is the product of two 3-digit numbers, it can't have more than 6 digits
    int digits[6];
    int i = -1;

    // Get the digits of n
    while (n > 0) {
        digits[++i] = n % 10;
        n /= 10;
    }

    // Check that first digit equals last, second equal second last, etc..
    for (int j = 0; j <= i/2; j++) {
        if (digits[i-j] != digits[j]) return 0;
    }
    return 1;
}

int get_largest_palindrome() {
    int largest_palindrome = 0;
    // Try all pairs of 3-digit numbers and keep store the largest palindromic product
    for (int i = 100; i <= 999; i++) {
        for (int j = 100; j <= 999; j++) {
            int product = i * j;
            if (is_palindrome(product) && product > largest_palindrome) {
                largest_palindrome = product;
            }
        }
    }
    return largest_palindrome;
}

int main() {
    int result = get_largest_palindrome();
    printf("%d\n", result);
    return 0;
}