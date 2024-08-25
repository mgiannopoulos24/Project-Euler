-- Define the main function
main :: IO ()
main = do
    -- Calculate the sum of multiples of 3 or 5 below 1000
    let sumMultiples = sum [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]
    -- Print the result
    print sumMultiples
