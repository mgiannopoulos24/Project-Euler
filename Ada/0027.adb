with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Max_Consecutive_Primes is

   -- Function to check if a number is prime
   function Is_Prime(N : in Integer) return Boolean is
      Sqrt_N : Integer;
   begin
      if N <= 1 then
         return False;
      elsif N = 2 then
         return True;
      elsif N mod 2 = 0 then
         return False;
      end if;

      Sqrt_N := Integer(Sqrt(Float(N)));
      for I in 3..Sqrt_N loop
         if I mod 2 = 1 and then N mod I = 0 then
            return False;
         end if;
      end loop;
      return True;
   end Is_Prime;

   -- Function to find the maximum number of consecutive primes
   procedure Find_Max_Consecutive_Primes is
      Max_Count : Integer := 0;
      Best_A    : Integer := 0;
      Best_B    : Integer := 0;

      -- Precompute all prime numbers up to 1000
      Is_Prime_Table : array (0..1000) of Boolean := (others => False);
   begin
      for I in 2..1000 loop
         if Is_Prime(I) then
            Is_Prime_Table(I) := True;
         end if;
      end loop;

      -- Iterate over all possible values of a and b
      for A in -999..999 loop
         for B in -1000..1000 loop
            -- Skip if b's absolute value isn't prime
            if Is_Prime_Table(abs B) then
               declare
                  N : Integer := 0;
                  Value : Integer;
               begin
                  loop
                     Value := N * N + A * N + B;
                     exit when Value <= 0 or else not Is_Prime(Value);
                     N := N + 1;
                  end loop;

                  if N > Max_Count then
                     Max_Count := N;
                     Best_A := A;
                     Best_B := B;
                  end if;
               end;
            end if;
         end loop;
      end loop;

      Put_Line("The coefficients (a, b) that produce the maximum number of consecutive primes are: (" & 
               Integer'Image(Best_A) & ", " & Integer'Image(Best_B) & ")");
      Put_Line("The product of the coefficients is: " & Integer'Image(Best_A * Best_B));
   end Find_Max_Consecutive_Primes;

begin
   Find_Max_Consecutive_Primes;
end Max_Consecutive_Primes;