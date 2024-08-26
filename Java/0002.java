public class SumEvenFibonacci {

    public static void main(String[] args) {
        final int MAX_VALUE = 4000000;

        // Initialize the first two terms of the Fibonacci sequence
        int term1 = 1;
        int term2 = 2;
        int sumEven = 0;

        // Loop to generate Fibonacci numbers and sum the even ones
        while (term1 <= MAX_VALUE) {
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
        System.out.println("Sum of the even-valued terms: " + sumEven);
    }
}
