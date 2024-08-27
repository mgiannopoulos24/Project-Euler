with Ada.Text_IO; use Ada.Text_IO;
with Ada.Long_Long_Integer_Text_IO; use Ada.Long_Long_Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Largest_Prime_Factor is

   -- Function to find the largest prime factor
   function Largest_Prime_Factor(N : in Long_Long_Integer) return Long_Long_Integer is
      Largest : Long_Long_Integer := 0;
      Num     : Long_Long_Integer := N;
   begin
      -- Remove all factors of 2
      while Num mod 2 = 0 loop
         Largest := 2;
         Num := Num / 2;
      end loop;

      -- Remove all factors of odd numbers
      for I in 3 .. Long_Long_Integer(Sqrt(Float(Num))) loop
         if I mod 2 /= 0 then
            while Num mod I = 0 loop
               Largest := I;
               Num := Num / I;
            end loop;
         end if;
      end loop;

      -- If n is a prime number greater than 2
      if Num > 2 then
         Largest := Num;
      end if;

      return Largest;
   end Largest_Prime_Factor;

   Number : constant Long_Long_Integer := 600_851_475_143;
   Result : Long_Long_Integer;

begin
   Result := Largest_Prime_Factor(Number);
   Put_Line("The largest prime factor of " & Long_Long_Integer'Image(Number) & " is " & Long_Long_Integer'Image(Result));
end Largest_Prime_Factor;
