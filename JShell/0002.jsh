// Define constants
int maxVal = 4000000;

// Initialize Fibonacci terms
int term1 = 1;
int term2 = 2;
int sumEven = 0;

// Compute the sum of even Fibonacci numbers
while (term1 <= maxVal) {
    // Check if the current term is even
    if (term1 % 2 == 0) {
        sumEven += term1;
    }

    // Calculate the next Fibonacci term
    int nextTerm = term1 + term2;
    term1 = term2;
    term2 = nextTerm;
}

// Output the result
System.out.println("Sum of the even-valued terms: " + sumEven);
