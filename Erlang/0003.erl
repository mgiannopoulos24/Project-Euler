
-module(prime_factor).
-export([main/1, largest_prime_factor/1]).

largest_prime_factor(N) ->
    largest_prime_factor(N, 2).

largest_prime_factor(1, Largest) ->
    Largest;
largest_prime_factor(N, _) when N rem 2 =:= 0 ->
    largest_prime_factor(N div 2, 2);
largest_prime_factor(N, Largest) ->
    largest_prime_factor_odd(N, Largest, 3).

largest_prime_factor_odd(1, Largest, _) ->
    Largest;
largest_prime_factor_odd(N, Largest, I) when I * I > N ->
    case N > Largest of
        true -> N;
        false -> Largest
    end;
largest_prime_factor_odd(N, _, I) when N rem I =:= 0 ->
    largest_prime_factor_odd(N div I, I, I);
largest_prime_factor_odd(N, Largest, I) ->
    largest_prime_factor_odd(N, Largest, I + 2).

main(_Args) ->
    Number = 600851475143,
    Result = largest_prime_factor(Number),
    io:format("The largest prime factor of ~B is ~B~n", [Number, Result]).