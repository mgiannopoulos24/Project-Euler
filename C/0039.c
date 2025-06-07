#include <stdio.h>
#include <math.h>

int main() {
    int max_solutions = 0;
    int optimal_p = 0;

    // Iterate over all possible perimeters p from 1 to 1000
    for (int p = 1; p <= 1000; p++) {
        int solutions = 0;

        // Iterate over possible values of a
        for (int a = 1; a <= p / 3; a++) {
            // Iterate over possible values of b
            for (int b = a; b <= (p - a) / 2; b++) {
                int c = p - a - b;

                // Check if a, b, c form a right-angled triangle
                if (a * a + b * b == c * c) {
                    solutions++;
                }
            }
        }

        // Update the maximum number of solutions and the corresponding p
        if (solutions > max_solutions) {
            max_solutions = solutions;
            optimal_p = p;
        }
    }

    printf("The value of p that maximizes the number of solutions is: %d\n", optimal_p);
    printf("Number of solutions for p = %d: %d\n", optimal_p, max_solutions);

    return 0;
}