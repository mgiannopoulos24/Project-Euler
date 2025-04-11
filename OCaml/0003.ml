let largest_prime_factor (n : int64) =
  let rec helper num factor =
    if num = 1L then factor
    else if num < Int64.mul factor factor then num (* Remaining number is prime *)
    else if Int64.rem num factor = 0L then
      helper (Int64.div num factor) factor (* Keep dividing by the same factor *)
    else
      helper num (Int64.add factor 2L) (* Move to the next odd factor *)
  in
  let n = if Int64.rem n 2L = 0L then Int64.div n 2L else n in
  helper n 3L

let () =
  let number = 600851475143L in
  let result = largest_prime_factor number in
  Printf.printf "The largest prime factor of %Ld is %Ld\n" number result