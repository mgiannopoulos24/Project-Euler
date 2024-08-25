let sumOfMultiples limit =
    seq { 1 .. limit - 1 } 
    |> Seq.filter (fun x -> x % 3 = 0 || x % 5 = 0)  
    |> Seq.sum  

let limit = 1000

printfn "The sum of all multiples of 3 or 5 below %d is: %d" limit (sumOfMultiples limit)
