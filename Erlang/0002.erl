-module(fibonacci_sum).
-export([main/1]).

% Entry point for the escript
main(Args) ->
    Limit = 4000000,
    Sum = sum_even_fibonacci(Limit),
    io:format("The sum of the even-valued terms below ~p is: ~p~n", [Limit, Sum]).

% Function to calculate the sum of even Fibonacci numbers below a given limit
sum_even_fibonacci(Limit) ->
    sum_even_fibonacci(1, 2, 0, Limit).

% Recursive function to accumulate the sum of even Fibonacci numbers
sum_even_fibonacci(A, B, Acc, Limit) when A =< Limit ->
    NewAcc = if 
        A rem 2 =:= 0 -> Acc + A;
        true -> Acc
    end,
    NextA = B,
    NextB = A + B,
    sum_even_fibonacci(NextA, NextB, NewAcc, Limit);
sum_even_fibonacci(_, _, Acc, _) ->
    Acc.
