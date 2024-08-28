#include <stdio.h>
#include <stdbool.h>

// Function to check if a number is prime
bool is_prime(int num) {
    if (num <= 1) return false;
    if (num == 2) return true;
    if (num % 2 == 0) return false;

    for (int i = 3; i * i <= num; i += 2) {
        if (num % i == 0) return false;
    }
    return true;
}

int main() {
    int count = 0;
    int number = 1;
    int target = 10001;

    // Find the 10001st prime number
    while (count < target) {
        number++;
        if (is_prime(number)) {
            count++;
        }
    }

    printf("The %dth prime number is %d\n", target, number);

    return 0;
}
