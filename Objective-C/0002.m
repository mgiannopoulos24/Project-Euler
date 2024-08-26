#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Define the maximum value
        const int maxVal = 4000000;
        
        // Initialize the first two terms of the Fibonacci sequence
        int term1 = 1;
        int term2 = 2;
        int sumEven = 0;
        
        // Compute the sum of even Fibonacci numbers
        while (term1 <= maxVal) {
            // Check if the current term is even
            if (term1 % 2 == 0) {
                sumEven += term1;
            }
            
            // Generate the next term in the Fibonacci sequence
            int nextTerm = term1 + term2;
            term1 = term2;
            term2 = nextTerm;
        }
        
        // Output the result
        NSLog(@"Sum of the even-valued terms: %d", sumEven);
    }
    return 0;
}
