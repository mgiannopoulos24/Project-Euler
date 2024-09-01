#include <stdio.h>

#define MAX 1000000

// Array to store the length of the sequence for each starting number
int cache[MAX + 1];

// Function to compute the length of the Collatz sequence for a given number
int collatzLength(int n) {
    int length = 1;
    long long num = n;  // Use long long to handle large numbers

    while (num != 1) {
        if (num < MAX && cache[num] != 0) {
            length += cache[num] - 1;
            break;
        }
        if (num % 2 == 0) {
            num /= 2;
        } else {
            num = 3 * num + 1;
        }
        length++;
    }

    return length;
}

int main() {
    int maxNumber = 1;
    int maxLength = 1;

    // Initialize cache with 0
    for (int i = 0; i <= MAX; i++) {
        cache[i] = 0;
    }

    // Fill the cache with lengths of sequences
    for (int i = 1; i <= MAX; i++) {
        int length = collatzLength(i);
        cache[i] = length;
        if (length > maxLength) {
            maxLength = length;
            maxNumber = i;
        }
    }

    printf("The starting number under %d that produces the longest chain is %d with a chain length of %d.\n", MAX, maxNumber, maxLength);

    return 0;
}
