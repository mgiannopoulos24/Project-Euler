with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
    -- Function to calculate the integer square root of a number
    function Integer_Square_Root(Value : Integer) return Integer is
        Result : Integer := 0;
        Test : Integer := 0;
    begin
        while (Result * Result) <= Value loop
            Test := Result + 1;
            if (Test * Test) > Value then
                return Result;
            end if;
            Result := Test;
        end loop;
        return Result;
    end Integer_Square_Root;

    -- Function to calculate the number of divisors of a given number
    function Count_Divisors(Num : Integer) return Integer is
        Count : Integer := 0;
        Sqrt_Num : Integer;
    begin
        Sqrt_Num := Integer_Square_Root(Num);
        for I in 1 .. Sqrt_Num loop
            if Num mod I = 0 then
                if I * I = Num then
                    Count := Count + 1; -- I and Num/I are the same
                else
                    Count := Count + 2; -- I and Num/I are different
                end if;
            end if;
        end loop;
        return Count;
    end Count_Divisors;

    -- Function to find the first triangle number with more than 'Divisor_Limit' divisors
    function Find_Triangle_Number_With_Divisors(Divisor_Limit : Integer) return Integer is
        N : Integer := 1;
        Triangle_Number : Integer := 0;
        Num_Divisors : Integer;
    begin
        loop
            Triangle_Number := Triangle_Number + N;
            Num_Divisors := Count_Divisors(Triangle_Number);

            if Num_Divisors > Divisor_Limit then
                return Triangle_Number;
            end if;

            N := N + 1;
        end loop;
    end Find_Triangle_Number_With_Divisors;

    -- Main procedure body
    Divisor_Limit : constant Integer := 500;
    Result : Integer;
begin
    Result := Find_Triangle_Number_With_Divisors(Divisor_Limit);
    Put_Line("The first triangle number with more than " & Integer'Image(Divisor_Limit) & " divisors is " & Integer'Image(Result));
end Main;
