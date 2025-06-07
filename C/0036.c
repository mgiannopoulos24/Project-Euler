#include <stdio.h>
#include <string.h>

// Function to check if a string is a palindrome
int is_palindrome(const char *str) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        if (str[i] != str[len - i - 1]) {
            return 0; // Not a palindrome
        }
    }
    return 1; // Is a palindrome
}

// Function to convert a number to its binary representation as a string
void to_binary(int num, char *binary_str) {
    int index = 0;
    while (num > 0) {
        binary_str[index++] = (num % 2) + '0'; // Convert remainder to '0' or '1'
        num /= 2;
    }
    binary_str[index] = '\0'; // Null-terminate the string

    // Reverse the string since we built it backwards
    int left = 0, right = index - 1;
    while (left < right) {
        char temp = binary_str[left];
        binary_str[left] = binary_str[right];
        binary_str[right] = temp;
        left++;
        right--;
    }
}

// Function to check if a number is palindromic in both base 10 and base 2
int is_double_palindrome(int num) {
    // Convert number to string for base 10 palindrome check
    char decimal_str[12]; // Maximum length for a 6-digit number plus null terminator
    sprintf(decimal_str, "%d", num);

    // Check if the number is a palindrome in base 10
    if (!is_palindrome(decimal_str)) {
        return 0;
    }

    // Convert number to binary string
    char binary_str[32]; // Maximum length for a 32-bit number plus null terminator
    to_binary(num, binary_str);

    // Check if the number is a palindrome in base 2
    if (!is_palindrome(binary_str)) {
        return 0;
    }

    return 1; // Number is palindromic in both bases
}

int main() {
    long long sum = 0;

    // Iterate through all numbers less than one million
    for (int i = 1; i < 1000000; i++) {
        if (is_double_palindrome(i)) {
            sum += i;
        }
    }

    // Output the result
    printf("The sum of all numbers less than one million that are palindromic in both base 10 and base 2 is: %lld\n", sum);

    return 0;
}