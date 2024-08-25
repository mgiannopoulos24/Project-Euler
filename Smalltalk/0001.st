| totalSum |
totalSum := 0.

1 to: 999 do: [:i |
    (i \\ 3 = 0 or: [i \\ 5 = 0]) ifTrue: [
        totalSum := totalSum + i.
    ].
].

Transcript show: 'The sum of all multiples of 3 or 5 below 1000 is: ', totalSum printString; cr.
