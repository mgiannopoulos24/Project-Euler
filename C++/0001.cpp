#include <iostream>

int sumOfMultiples(int limit) {
    int totalSum = 0;
    for (int i = 1; i < limit; ++i) {
        if (i % 3 == 0 || i % 5 == 0) {
            totalSum += i;
        }
    }
    return totalSum;
}

int main() {
    // Define the limit
    const int limit = 1000;
    
    // Calculate the sum of multiples of 3 or 5 below the limit
    int result = sumOfMultiples(limit);
    
    // Print the result
    std::cout << "The sum of all multiples of 3 or 5 below " << limit << " is: " << result << std::endl;
    
    return 0;
}
