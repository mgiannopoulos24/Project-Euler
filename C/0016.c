#include <stdio.h>
#include <string.h>

#define MAX_DIGITS 302  // This is enough to store 2^1000 (approximately 1000/log10(2) + 1)

void multiply(int *result, int num, int *size) {
    int carry = 0;
    for (int i = 0; i < *size; i++) {
        int prod = result[i] * num + carry;
        result[i] = prod % 10;
        carry = prod / 10;
    }
    while (carry) {
        result[(*size)++] = carry % 10;
        carry /= 10;
    }
}

int main() {
    int result[MAX_DIGITS];
    int size = 1;  // Number of digits in the result

    memset(result, 0, sizeof(result));
    result[0] = 1;  // 2^0 = 1

    for (int i = 0; i < 1000; i++) {
        multiply(result, 2, &size);
    }

    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += result[i];
    }

    printf("The sum of the digits of 2^1000 is: %d\n", sum);

    return 0;
}
