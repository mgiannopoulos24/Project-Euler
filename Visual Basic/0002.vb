Module FibonacciSum
    Sub Main()
        ' Define the limit (4 million)
        Dim limit As Integer = 4000000

        ' Calculate the sum of even-valued Fibonacci numbers
        Dim result As Integer = SumEvenFibonacci(limit)

        ' Print the result
        Console.WriteLine("The sum of the even-valued terms is: " & result)
    End Sub

    Function SumEvenFibonacci(ByVal limit As Integer) As Integer
        Dim a As Integer = 1
        Dim b As Integer = 2
        Dim evenSum As Integer = 0

        While a <= limit
            If a Mod 2 = 0 Then
                evenSum += a
            End If
            Dim nextFib As Integer = a + b
            a = b
            b = nextFib
        End While

        Return evenSum
    End Function
End Module
