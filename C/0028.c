#include <stdio.h>

// Function to calculate the sum of diagonal elements in an n x n spiral
long long sum_of_diagonals(int n) {
    if (n % 2 == 0) {
        printf("Error: n must be odd.\n");
        return 0;
    }

    long long total_sum = 1; // Start with the center element (1)

    // Number of layers in the spiral
    int layers = (n + 1) / 2;

    // Iterate over each layer starting from the second layer
    for (int k = 2; k <= layers; k++) {
        int side_length = 2 * k - 1; // Side length of the current layer
        int corner_base = side_length * side_length; // Largest number in the layer

        // Sum of the four corners of the current layer
        long long layer_sum = 4 * corner_base - 6 * (side_length - 1);

        // Add the layer sum to the total sum
        total_sum += layer_sum;
    }

    return total_sum;
}

int main() {
    int n = 1001; // Size of the spiral

    // Calculate the sum of diagonal elements
    long long result = sum_of_diagonals(n);

    // Output the result
    printf("The sum of the numbers on the diagonals in a %d by %d spiral is: %lld\n", n, n, result);

    return 0;
}