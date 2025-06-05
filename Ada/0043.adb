with Ada.Text_IO; use Ada.Text_IO;
with Ada.Long_Long_Integer_Text_IO; use Ada.Long_Long_Integer_Text_IO;

procedure Pandigital_Sum is
   -- Sum of all valid pandigital numbers
   Total_Sum : Long_Long_Integer := 0;
   
   -- For tracking used digits
   type Digit_Used is array (0 .. 9) of Boolean;
   
   -- For storing the current sequence of digits
   type Digit_Sequence is array (1 .. 10) of Natural;
   
   -- Convert a sequence of digits to a long integer
   function To_Number (Digit_Array : Digit_Sequence) return Long_Long_Integer is
      Result : Long_Long_Integer := 0;
   begin
      for I in Digit_Array'Range loop
         Result := Result * 10 + Long_Long_Integer(Digit_Array(I));
      end loop;
      return Result;
   end To_Number;
   
   -- Check if digits form a number divisible by divisor
   function Is_Divisible (D1, D2, D3 : Natural; Divisor : Positive) return Boolean is
      Number : Natural;
   begin
      Number := D1 * 100 + D2 * 10 + D3;
      return Number mod Divisor = 0;
   end Is_Divisible;
   
   -- Recursive function to build valid pandigital numbers
   procedure Generate_Pandigitals (Current : in out Digit_Sequence;
                                  Used : in out Digit_Used;
                                  Position : Positive) is
   begin
      -- If we've filled all positions, we have a valid pandigital number
      if Position > 10 then
         Total_Sum := Total_Sum + To_Number(Current);
         return;
      end if;
      
      -- Try placing each unused digit at the current position
      for Digit in 0 .. 9 loop
         if not Used(Digit) then
            -- Skip putting 0 at first position
            if Position = 1 and Digit = 0 then
               null;  -- Skip
            else
               -- Check divisibility constraints based on position
               declare
                  Valid : Boolean := True;
               begin
                  if Position = 4 then
                     Valid := Is_Divisible(Current(2), Current(3), Digit, 2);
                  elsif Position = 5 then
                     Valid := Is_Divisible(Current(3), Current(4), Digit, 3);
                  elsif Position = 6 then
                     Valid := Is_Divisible(Current(4), Current(5), Digit, 5);
                  elsif Position = 7 then
                     Valid := Is_Divisible(Current(5), Current(6), Digit, 7);
                  elsif Position = 8 then
                     Valid := Is_Divisible(Current(6), Current(7), Digit, 11);
                  elsif Position = 9 then
                     Valid := Is_Divisible(Current(7), Current(8), Digit, 13);
                  elsif Position = 10 then
                     Valid := Is_Divisible(Current(8), Current(9), Digit, 17);
                  end if;
                  
                  if Valid then
                     -- Place digit and continue
                     Current(Position) := Digit;
                     Used(Digit) := True;
                     Generate_Pandigitals(Current, Used, Position + 1);
                     Used(Digit) := False;  -- Backtrack
                  end if;
               end;
            end if;
         end if;
      end loop;
   end Generate_Pandigitals;
   
   Sequence : Digit_Sequence := (others => 0);
   Used : Digit_Used := (others => False);
   
begin
   -- Start the recursive generation
   Generate_Pandigitals(Sequence, Used, 1);
   
   -- Output the result
   Put("Sum of all valid pandigital numbers: ");
   Put(Total_Sum, Width => 0);
   New_Line;
end Pandigital_Sum;