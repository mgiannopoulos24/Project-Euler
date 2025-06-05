with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Containers.Vectors;

procedure Pandigital_Prime_Finder is
   -- Function to check if a number is prime
   function Is_Prime(N : Integer) return Boolean is
   begin
      if N <= 1 then
         return False;
      end if;
      
      if N <= 3 then
         return True;
      end if;
      
      if N mod 2 = 0 or N mod 3 = 0 then
         return False;
      end if;
      
      declare
         I : Integer := 5;
      begin
         while I * I <= N loop
            if N mod I = 0 or N mod (I + 2) = 0 then
               return False;
            end if;
            I := I + 6;
         end loop;
         
         return True;
      end;
   end Is_Prime;
   
   -- Package for the vector of integers
   package Int_Vectors is new Ada.Containers.Vectors
     (Index_Type => Natural,
      Element_Type => Integer);
   use Int_Vectors;
   
   -- Function to convert a digit array to an integer
   function Digits_To_Integer(Digit_Array : in Vector) return Integer is
      Result : Integer := 0;
   begin
      for I in 0..Integer(Digit_Array.Length) - 1 loop
         Result := Result * 10 + Digit_Array(I);
      end loop;
      return Result;
   end Digits_To_Integer;
   
   -- The largest pandigital prime found
   Largest_Prime : Integer := 0;
   
   -- Procedure to check a permutation for primality
   procedure Check_Permutation(Digit_Array : Vector) is
      Num : Integer;
   begin
      Num := Digits_To_Integer(Digit_Array);
      if Is_Prime(Num) and then Num > Largest_Prime then
         Largest_Prime := Num;
      end if;
   end Check_Permutation;
   
   -- Procedure to generate permutations
   procedure Generate_Permutations(Digit_Array : in out Vector; Position : Natural) is
      Temp : Integer;
   begin
      if Position = Digit_Array.Last_Index then
         -- We have a complete permutation
         Check_Permutation(Digit_Array);
      else
         for I in Position..Digit_Array.Last_Index loop
            -- Swap elements at Position and I
            Temp := Digit_Array(Position);
            Digit_Array(Position) := Digit_Array(I);
            Digit_Array(I) := Temp;
            
            -- Recursive call
            Generate_Permutations(Digit_Array, Position + 1);
            
            -- Swap back
            Temp := Digit_Array(Position);
            Digit_Array(Position) := Digit_Array(I);
            Digit_Array(I) := Temp;
         end loop;
      end if;
   end Generate_Permutations;
   
   -- Function to check if a pandigital of length N can be prime
   function Can_Be_Prime(N : Integer) return Boolean is
      -- Sum of 1..N
      Sum_Of_Digits : Integer := (N * (N + 1)) / 2;
   begin
      -- If sum of digits is divisible by 3, then the number is divisible by 3
      -- (except we should check n=3 individually)
      return N = 3 or else Sum_Of_Digits mod 3 /= 0;
   end Can_Be_Prime;
   
begin
   -- Check pandigitals of lengths 9 down to 1
   for N in reverse 1..9 loop
      -- Based on the divisibility by 3 rule, only check certain lengths
      if Can_Be_Prime(N) then
         declare
            Digit_Array : Vector;
         begin
            -- Initialize digits array with values 1 to N
            for I in 1..N loop
               Digit_Array.Append(I);
            end loop;
            
            -- Generate all permutations
            Generate_Permutations(Digit_Array, 0);
            
            -- If we found a prime at this length, we're done
            if Largest_Prime > 0 then
               exit;
            end if;
         end;
      end if;
   end loop;
   
   -- Output the result
   Put("The largest pandigital prime is: ");
   Put(Largest_Prime, Width => 0);
   New_Line;
end Pandigital_Prime_Finder;