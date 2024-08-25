Dim sum As Integer
sum = 0

For i As Integer = 1 To 999
    If (i Mod 3 = 0) Or (i Mod 5 = 0) Then
        sum += i
    End If
Next

Print "The sum of all multiples of 3 or 5 below 1000 is: "; sum

Sleep