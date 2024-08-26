' Initialize the first two terms of the Fibonacci sequence
Dim As ULong a = 1
Dim As ULong b = 2
Dim As ULong sum = 0

' Iterate until the terms exceed four million
While a <= 4000000
    ' Check if the term is even
    If a Mod 2 = 0 Then
        sum += a
    End If

    ' Generate the next Fibonacci number
    Dim As ULong nextTerm = a + b
    a = b
    b = nextTerm
Wend

' Print the sum of the even-valued terms
Print "The sum of the even-valued terms is: "; sum
