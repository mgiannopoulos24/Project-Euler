-- Function to generate Fibonacci sequence
fibonacci :: [Integer]
fibonacci = 1 : 2 : zipWith (+) fibonacci (tail fibonacci)

-- Function to sum even Fibonacci numbers up to a given maximum value
sumEvenFibonacci :: Integer -> Integer
sumEvenFibonacci maxVal = sum [x | x <- takeWhile (<= maxVal) fibonacci, even x]

-- Main function to compute and print the result
main :: IO ()
main = do
    let maxValue = 4000000
    let result = sumEvenFibonacci maxValue
    print result
