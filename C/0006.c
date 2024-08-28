#include <stdio.h>

int main() {
    int n = 100;
    long long sum_of_squares = 0;
    long long sum = 0;
    long long square_of_sum;

    // Calculate the sum of squares and the sum of the first n natural numbers
    for (int i = 1; i <= n; i++) {
        sum_of_squares += (long long)i * i;
        sum += i;
    }

    // Calculate the square of the sum
    square_of_sum = (long long)sum * sum;

    // Calculate the difference
    long long difference = square_of_sum - sum_of_squares;

    // Print the result
    printf("The difference between the square of the sum and the sum of the squares of the first %d natural numbers is %lld\n", n, difference);

    return 0;
}
