(* Function to calculate the sum of multiples of 3 or 5 below a given limit *)
let sum_of_multiples limit =
  let is_multiple_of_3_or_5 n = (n mod 3 = 0) || (n mod 5 = 0) in
  let numbers = List.init (limit - 1) (fun i -> i + 1) in
  List.fold_left (fun acc x -> if is_multiple_of_3_or_5 x then acc + x else acc) 0 numbers

(* Main function *)
let () =
  let limit = 1000 in
  let result = sum_of_multiples limit in
  Printf.printf "The sum of all multiples of 3 or 5 below %d is: %d\n" limit result
