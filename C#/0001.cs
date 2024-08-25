using System;

class Program
{
    static void Main()
    {
        // Define the limit
        int limit = 1000;

        // Calculate the sum of multiples of 3 or 5 below the limit
        int result = SumOfMultiples(limit);

        // Print the result
        Console.WriteLine($"The sum of all multiples of 3 or 5 below {limit} is: {result}");
    }

    static int SumOfMultiples(int limit)
    {
        int totalSum = 0;
        for (int i = 1; i < limit; i++)
        {
            if (i % 3 == 0 || i % 5 == 0)
            {
                totalSum += i;
            }
        }
        return totalSum;
    }
}
