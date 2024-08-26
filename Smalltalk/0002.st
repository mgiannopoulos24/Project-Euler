Object subclass: FibonacciSum [
    FibonacciSum class >> sumEvenFibonacciUpTo: limit [
        | a b evenSum next |
        a := 1.
        b := 2.
        evenSum := 0.

        [ a <= limit ] whileTrue: [
            "Check if the term is even and add it to the sum"
            a \\ 2 = 0 ifTrue: [ evenSum := evenSum + a. ].

            "Calculate the next Fibonacci number"
            next := a + b.
            a := b.
            b := next.
        ].

        ^evenSum
    ]

    FibonacciSum class >> printSumOfEvenFibonacciUpTo: limit [
        | result |
        result := self sumEvenFibonacciUpTo: limit.
        'The sum of the even-valued terms is: ', result printString displayNl.
    ]
]

"Usage:"
FibonacciSum printSumOfEvenFibonacciUpTo: 4000000.