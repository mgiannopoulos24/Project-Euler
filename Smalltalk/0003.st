| number maxPrime i |

number := 600851475143.
maxPrime := -1.

"Step 1: Remove all factors of 2"
[number \\ 2 = 0] whileTrue: [
    maxPrime := 2.
    number := number // 2
].

"Step 2: Try odd factors from 3 upwards"
i := 3.
[i * i <= number] whileTrue: [
    [number \\ i = 0] whileTrue: [
        maxPrime := i.
        number := number // i
    ].
    i := i + 2
].

"Step 3: If remaining number is > 2, it's a prime"
number > 2 ifTrue: [ maxPrime := number ].

Transcript show: 'The largest prime factor is ', maxPrime printString; cr.