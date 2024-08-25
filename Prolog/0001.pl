:- initialization(main).

% Predicate to compute the sum of multiples of 3 or 5 below 1000
sum_multiples(Sum) :-
    findall(X, (between(1, 999, X), (X mod 3 =:= 0; X mod 5 =:= 0)), Multiples),
    remove_duplicates(Multiples, UniqueMultiples), % Ensure uniqueness of multiples
    sum_list(UniqueMultiples, Sum).

% Custom implementation to remove duplicates from a list
remove_duplicates([], []).
remove_duplicates([H|T], Unique) :-
    member(H, T), % If H is in the tail, discard it
    remove_duplicates(T, Unique).
remove_duplicates([H|T], [H|Unique]) :-
    \+ member(H, T), % If H is not in the tail, keep it
    remove_duplicates(T, Unique).

% Main predicate to print the result
main :-
    sum_multiples(Sum),
    format('~w~n', [Sum]).
