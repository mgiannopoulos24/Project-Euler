using System;

class Program
{
    // Function to find the largest prime factor
    static long LargestPrimeFactor(long n)
    {
        long largest = 0;

        // Remove all factors of 2
        while (n % 2 == 0)
        {
            largest = 2;
            n /= 2;
        }

        // Remove all factors of odd numbers
        for (long i = 3; i * i <= n; i += 2)
        {
            while (n % i == 0)
            {
                largest = i;
                n /= i;
            }
        }

        // If n is a prime number greater than 2
        if (n > 2)
        {
            largest = n;
        }

        return largest;
    }

    static void Main()
    {
        long number = 600851475143;
        long result = LargestPrimeFactor(number);

        Console.WriteLine($"The largest prime factor of {number} is {result}");
    }
}
