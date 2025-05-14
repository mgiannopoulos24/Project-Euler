-- Function to find the largest prime factor
largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n = go n 0 2
  where
    -- Remove factors of 2
    go remaining _ divisor | divisor * divisor > remaining = if remaining > 2 then remaining else 2
    go remaining largest 2 =
      if remaining `mod` 2 == 0
        then go (remaining `div` 2) 2 2
        else go remaining 2 3
    go remaining largest divisor =
      if remaining `mod` divisor == 0
        then go (remaining `div` divisor) divisor divisor
        else go remaining divisor (divisor + 2)

main :: IO ()
main = do
  let number = 600851475143
  let result = largestPrimeFactor number
  putStrLn $ "The largest prime factor of " ++ show number ++ " is " ++ show result