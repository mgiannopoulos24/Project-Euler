with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Truncatable_Primes is
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
   
   -- Function to check if number is left-truncatable
   function Is_Left_Truncatable(N : Integer) return Boolean is
      Temp : Integer := N;
      Power : Integer := 1;
   begin
      -- Find highest power of 10 less than N
      while Power * 10 <= N loop
         Power := Power * 10;
      end loop;
      
      -- Truncate from left and check if each result is prime
      while Temp > 0 loop
         if not Is_Prime(Temp) then
            return False;
         end if;
         Temp := Temp mod Power;
         Power := Power / 10;
      end loop;
      
      return True;
   end Is_Left_Truncatable;
   
   -- Function to check if number is right-truncatable
   function Is_Right_Truncatable(N : Integer) return Boolean is
      Temp : Integer := N;
   begin
      while Temp > 0 loop
         if not Is_Prime(Temp) then
            return False;
         end if;
         Temp := Temp / 10;
      end loop;
      
      return True;
   end Is_Right_Truncatable;
   
   Count : Integer := 0;
   Sum : Long_Integer := 0;
   N : Integer := 11;  -- Start with 11 as single-digit primes are excluded
   
begin
   Put_Line("Finding the eleven two-way truncatable primes...");
   
   while Count < 11 loop
      if Is_Left_Truncatable(N) and Is_Right_Truncatable(N) then
         Put("Found: ");
         Put(N, Width => 0);
         New_Line;
         
         Sum := Sum + Long_Integer(N);
         Count := Count + 1;
      end if;
      
      N := N + 2;  -- Only check odd numbers after 11
   end loop;
   
   Put("The sum of the eleven two-way truncatable primes is: ");
   Put(Integer(Sum), Width => 0);
   New_Line;
end Truncatable_Primes;