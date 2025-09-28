' Function to find the largest prime factor
Function largest_prime_factor(n As LongInt) As LongInt
    Dim As LongInt largest = 0

    ' Remove all factors of 2
    While n Mod 2 = 0
        largest = 2
        n = n \ 2
    Wend

    ' Remove all factors of odd numbers
    Dim As LongInt i = 3
    While i * i <= n
        While n Mod i = 0
            largest = i
            n = n \ i
        Wend
        i += 2
    Wend

    ' If n is a prime number greater than 2
    If n > 2 Then
        largest = n
    End If

    Return largest
End Function

Dim As LongInt number = 600851475143
Dim As LongInt result = largest_prime_factor(number)

Print "The largest prime factor of "; number; " is "; result