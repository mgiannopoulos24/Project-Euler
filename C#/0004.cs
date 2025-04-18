using System;

class LargestPalindromeProduct
{
    static bool IsPalindrome(int number)
    {
        string numStr = number.ToString();
        int left = 0;
        int right = numStr.Length - 1;

        while (left < right)
        {
            if (numStr[left] != numStr[right])
            {
                return false;
            }
            left++;
            right--;
        }
        return true;
    }

    static int FindLargestPalindrome()
    {
        int largestPalindrome = 0;

        for (int i = 999; i >= 100; i--)
        {
            for (int j = i; j >= 100; j--)
            {
                int product = i * j;
                if (product <= largestPalindrome)
                {
                    break; // No need to check smaller j values
                }
                if (IsPalindrome(product))
                {
                    largestPalindrome = product;
                }
            }
        }
        return largestPalindrome;
    }

    static void Main()
    {
        int result = FindLargestPalindrome();
        Console.WriteLine("The largest palindrome made from the product of two 3-digit numbers is: " + result);
    }
}