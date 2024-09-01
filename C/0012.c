#include <stdio.h>
#include <math.h>

// Function to calculate the number of divisors of a given number
int countDivisors(int num) {
    int count = 0;
    int sqrtNum = (int) sqrt(num);
    for (int i = 1; i <= sqrtNum; i++) {
        if (num % i == 0) {
            if (i * i == num) {
                count++; // i and num/i are the same
            } else {
                count += 2; // i and num/i are different
            }
        }
    }
    return count;
}

// Function to find the first triangle number with more than 'divisorLimit' divisors
int findTriangleNumberWithDivisors(int divisorLimit) {
    int n = 1;
    int triangleNumber = 0;

    while (1) {
        triangleNumber += n;
        int numDivisors = countDivisors(triangleNumber);

        if (numDivisors > divisorLimit) {
            return triangleNumber;
        }

        n++;
    }
}

int main() {
    int divisorLimit = 500;
    int result = findTriangleNumberWithDivisors(divisorLimit);
    printf("The first triangle number with more than %d divisors is %d\n", divisorLimit, result);
    return 0;
}
