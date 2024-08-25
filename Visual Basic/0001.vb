Module Module1
    Sub Main()
        ' Define the limit
        Dim limit As Integer = 1000
        
        ' Calculate the sum of multiples of 3 or 5 below the limit
        Dim result As Integer = SumOfMultiples(limit)
        
        ' Print the result
        Console.WriteLine("The sum of all multiples of 3 or 5 below " & limit & " is: " & result)
    End Sub

    Function SumOfMultiples(ByVal limit As Integer) As Integer
        Dim totalSum As Integer = 0
        For i As Integer = 1 To limit - 1
            If i Mod 3 = 0 Or i Mod 5 = 0 Then
                totalSum += i
            End If
        Next
        Return totalSum
    End Function
End Module
