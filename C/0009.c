#include <stdio.h>

int main() {
    int a, b, c;
    int target_sum = 1000;

    // Iterate over possible values of a and b
    for (a = 1; a < target_sum / 3; a++) {
        for (b = a + 1; b < target_sum / 2; b++) {
            c = target_sum - a - b;
            // Check if it forms a Pythagorean triplet
            if (a * a + b * b == c * c) {
                printf("The Pythagorean triplet is: a = %d, b = %d, c = %d\n", a, b, c);
                printf("The product abc is: %d\n", a * b * c);
                return 0;
            }
        }
    }

    printf("No Pythagorean triplet found.\n");
    return 1;
}
