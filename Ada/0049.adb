with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Find_Prime_Sequence is

   -- Function to check if a number is prime
   function Is_Prime (Num : Integer) return Boolean is
   begin
      if Num <= 1 then
         return False;
      elsif Num = 2 then
         return True;
      elsif Num mod 2 = 0 then
         return False;
      end if;

      for I in 3 .. Integer(Sqrt(Float(Num))) loop
         if I mod 2 /= 0 and then Num mod I = 0 then
            return False;
         end if;
      end loop;

      return True;
   end Is_Prime;

   -- Function to convert an integer to 4-digit string
   function To_String (N : Integer) return String is
      S : constant String := Integer'Image(N);
   begin
      return S(S'First + 1 .. S'First + 4); -- Skip leading space
   end To_String;

   -- Function to check if two numbers are permutations of each other
   function Are_Permutations (A, B : Integer) return Boolean is
     function To_String (N : Integer) return String is
        S : constant String := Integer'Image(N);
     begin
        return S(S'First + 1 .. S'First + 4); -- Skip leading space
     end To_String;
  
     SA : constant String := To_String(A);
     SB : constant String := To_String(B);
  
     Count_A : array (Character'('0') .. Character'('9')) of Natural := (others => 0);
     Count_B : array (Character'('0') .. Character'('9')) of Natural := (others => 0);
  begin
     for C of SA loop
        if C in Character'('0') .. Character'('9') then
           Count_A(C) := Count_A(C) + 1;
        end if;
     end loop;
  
     for C of SB loop
        if C in Character'('0') .. Character'('9') then
           Count_B(C) := Count_B(C) + 1;
        end if;
     end loop;
  
     for D in Character'('0') .. Character'('9') loop
        if Count_A(D) /= Count_B(D) then
           return False;
        end if;
     end loop;
  
     return True;
  end Are_Permutations;

   -- Generate all 4-digit primes
   Max_Primes : constant := 10_000;
   Primes     : array (1 .. Max_Primes) of Integer;
   Count      : Natural := 0;

begin
   for I in 1000 .. 9999 loop
      if Is_Prime(I) then
         Count := Count + 1;
         Primes(Count) := I;
      end if;
   end loop;

   -- Search for arithmetic sequences
   for I in 1 .. Count - 2 loop
      for J in I + 1 .. Count - 1 loop
         declare
            A : constant Integer := Primes(I);
            B : constant Integer := Primes(J);
         begin
            if not Are_Permutations(A, B) then
               goto Continue_J_Loop;
            end if;

            declare
               D : constant Integer := B - A;
               C : constant Integer := B + D;
            begin
               if C >= 1000 and C < 10000 and Is_Prime(C) and Are_Permutations(A, C) then
                  if not (A = 1487 and B = 4817 and C = 8147) then
                     Put_Line("The 12-digit number formed by concatenating the sequence is: "
                              & Integer'Image(A)
                              & Integer'Image(B)
                              & Integer'Image(C));
                     return;
                  end if;
               end if;
            end;
            <<Continue_J_Loop>>
            null;
         end;
      end loop;
   end loop;
end Find_Prime_Sequence;