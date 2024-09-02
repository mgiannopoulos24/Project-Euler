with Ada.Text_IO; use Ada.Text_IO;

procedure Collatz is
    -- Define the maximum value for the cache
    Max : constant Integer := 1000000;
    
    -- Array to store the length of the sequence for each starting number
    type Cache_Array is array (1 .. Max) of Natural;
    Cache : Cache_Array;

    -- Function to compute the length of the Collatz sequence for a given number
    function Collatz_Length(N : Natural) return Natural is
        Length : Natural := 1;
        Num : Long_Long_Integer := Long_Long_Integer(N);  -- Use Long_Long_Integer to handle large numbers
    begin
        while Num /= 1 loop
            if Num < Long_Long_Integer(Max) and then Cache(Integer(Num)) /= 0 then
                Length := Length + Cache(Integer(Num)) - 1;
                exit;
            end if;

            if Num mod 2 = 0 then
                Num := Num / 2;
            else
                Num := 3 * Num + 1;
            end if;

            Length := Length + 1;
        end loop;

        return Length;
    end Collatz_Length;

    Max_Number : Integer := 1;
    Max_Length : Natural := 1;
    Length : Natural;
begin
    -- Initialize cache with 0
    for I in Cache'Range loop
        Cache(I) := 0;
    end loop;

    -- Fill the cache with lengths of sequences
    for I in 1 .. Max loop
        Length := Collatz_Length(Natural(I));
        Cache(I) := Length;
        if Length > Max_Length then
            Max_Length := Length;
            Max_Number := I;
        end if;
    end loop;

    -- Print the result
    Put_Line("The starting number under " & Max'Img & " that produces the longest chain is " &
             Max_Number'Img & " with a chain length of " & Max_Length'Img & ".");
end Collatz;
