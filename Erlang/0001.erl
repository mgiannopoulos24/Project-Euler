-module(sum_multiples).
-export([main/1]).

% Entry point for the escript
main(Args) ->
    Limit = 1000,
    Sum = sum_of_multiples(Limit),
    io:format("The sum of all multiples of 3 or 5 below ~p is: ~p~n", [Limit, Sum]).

% Function to calculate the sum of multiples of 3 or 5
sum_of_multiples(Limit) when Limit > 0 ->
    Sum = lists:sum(
        [X || X <- lists:seq(1, Limit - 1), (X rem 3 =:= 0 orelse X rem 5 =:= 0)]
    ),
    Sum.