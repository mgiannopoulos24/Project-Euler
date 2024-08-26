open System

[<EntryPoint>]
let main argv =
    // Initialize the first two terms of the Fibonacci sequence
    let mutable a = 1UL
    let mutable b = 2UL
    let mutable sum = 0UL

    // Iterate until the terms exceed four million
    while a <= 4000000UL do
        // Check if the term is even
        if a % 2UL = 0UL then
            sum <- sum + a
        
        // Generate the next Fibonacci number
        let next = a + b
        a <- b
        b <- next

    // Print the sum of the even-valued terms
    printfn "The sum of the even-valued terms is: %d" sum

    0 // Return an integer exit code
