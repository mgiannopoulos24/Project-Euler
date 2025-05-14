// Function to find the largest prime factor
let largest_prime_factor n =
    let rec loop (n: int64) (largest: int64) i =
        if n % 2L = 0L then
            // Remove all factors of 2
            let n' = n / 2L
            if n' > 0L then loop n' 2L (i + 1L)
            else 2L
        else if i * i > n then
            // If remaining n is a prime > 2
            if n > 2L then n else largest
        else
            if n % i = 0L then
                // i is a prime factor
                let n' = n / i
                loop n' i i
            else
                // Try next odd number
                loop n largest (i + 2L)

    loop n 0L 3L

[<EntryPoint>]
let main argv =
    let number = 600851475143L
    let result = largest_prime_factor number
    printfn "The largest prime factor of %d is %d" number result
    0