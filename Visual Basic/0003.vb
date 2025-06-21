Module LargestPrimeFactor

    Function LargestPrimeFactor(n As Long) As Long
        Dim maxPrime As Long = -1

        ' Step 1: Remove all factors of 2
        While n Mod 2 = 0
            maxPrime = 2
            n = n \ 2
        End While

        ' Step 2: Try odd factors from 3 upwards
        Dim i As Long = 3
        While i * i <= n
            While n Mod i = 0
                maxPrime = i
                n = n \ i
            End While
            i += 2
        End While

        ' Step 3: If remaining n is greater than 2, then it's a prime
        If n > 2 Then
            maxPrime = n
        End If

        Return maxPrime
    End Function

    Sub Main()
        Dim number As Long = 600851475143
        Dim result As Long = LargestPrimeFactor(number)
        Console.WriteLine("The largest prime factor of " & number & " is " & result)
    End Sub

End Module