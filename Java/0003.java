public class LargestPrimeFactor {

    // Function to find the largest prime factor
    public static long largestPrimeFactor(long n) {
        long largest = 0;

        // Remove all factors of 2
        while (n % 2 == 0) {
            largest = 2;
            n /= 2;
        }

        // Check for odd factors from 3 up to sqrt(n)
        for (long i = 3; i * i <= n; i += 2) {
            while (n % i == 0) {
                largest = i;
                n /= i;
            }
        }

        // If remaining n is a prime number > 2
        if (n > 2) {
            largest = n;
        }

        return largest;
    }

    public static void main(String[] args) {
        long number = 600851475143L;
        long result = largestPrimeFactor(number);
        System.out.println("The largest prime factor of " + number + " is " + result);
    }
}