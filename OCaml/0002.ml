(* Function to compute the sum of even Fibonacci numbers up to a given maximum value *)
let sum_even_fibonacci max_val =
  let rec aux term1 term2 sum_even =
    if term1 > max_val then
      sum_even
    else
      let sum_even = if term1 mod 2 = 0 then sum_even + term1 else sum_even in
      let next_term = term1 + term2 in
      aux term2 next_term sum_even
  in
  aux 1 2 0

(* Define the maximum value *)
let max_value = 4000000

(* Calculate and print the result *)
let () =
  let result = sum_even_fibonacci max_value in
  Printf.printf "Sum of the even-valued terms: %d\n" result
