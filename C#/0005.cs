using System;
using System.Collections.Generic;

class Program
{
    // Represents a prime factor and its maximum power
    struct Factor
    {
        public int Number;
        public int Power;
    }

    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int i = 2; i * i <= n; i++)
        {
            if (n % i == 0) return false;
        }
        return true;
    }

    static int NextPrime(int prime)
    {
        int n = prime + 1;
        while (!IsPrime(n))
        {
            n++;
        }
        return n;
    }

    static long GetSmallestDivisibleNumber()
    {
        List<Factor> factors = new List<Factor>(); // dynamically grow as needed

        for (int i = 20; i >= 1; i--)
        {
            int n = i;
            for (int prime = 2; prime <= i; prime = NextPrime(prime))
            {
                int power = 0;
                while (n % prime == 0)
                {
                    n /= prime;
                    power++;
                }

                if (power == 0) continue;

                // Check if the prime is already in the list
                bool found = false;
                foreach (var f in factors)
                {
                    if (f.Number == prime)
                    {
                        found = true;
                        if (power > f.Power)
                        {
                            // Update power
                            var updatedFactor = new Factor { Number = prime, Power = power };
                            for (int j = 0; j < factors.Count; j++)
                            {
                                if (factors[j].Number == prime)
                                {
                                    factors[j] = updatedFactor;
                                    break;
                                }
                            }
                        }
                        break;
                    }
                }

                // Prime not found - add it
                if (!found)
                {
                    factors.Add(new Factor { Number = prime, Power = power });
                }
            }
        }

        // Generate result by multiplying all primes raised to their max power
        long result = 1;
        foreach (var factor in factors)
        {
            result *= (long)Math.Pow(factor.Number, factor.Power);
        }

        return result;
    }

    static void Main(string[] args)
    {
        long result = GetSmallestDivisibleNumber();
        Console.WriteLine(result);
    }
}