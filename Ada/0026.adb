with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Longest_Recurring_Cycle is

   -- Function to compute GCD using the Euclidean algorithm
   function GCD(A, B : Integer) return Integer is
      Temp : Integer := B;
      A_Temp : Integer := A;
   begin
      while Temp /= 0 loop
         declare
            Remainder : Integer := A_Temp mod Temp;
         begin
            A_Temp := Temp;
            Temp := Remainder;
         end;
      end loop;
      return A_Temp;
   end GCD;

   -- Function to compute the order of 10 modulo d
   function Find_Order(D : Integer) return Integer is
      K : Integer := 1;
      Power : Integer := 10 mod D;
   begin
      if GCD(10, D) /= 1 then
         return 0; -- Not coprime, no recurring cycle
      end if;

      while Power /= 1 loop
         Power := (Power * 10) mod D;
         K := K + 1;
      end loop;

      return K;
   end Find_Order;

   Max_Cycle_Length : Integer := 0;
   Result_D : Integer := 0;

begin
   -- Iterate over all d from 2 to 999
   for D in 2 .. 999 loop
      declare
         Cycle_Length : Integer := Find_Order(D);
      begin
         -- Update the maximum cycle length and corresponding d
         if Cycle_Length > Max_Cycle_Length then
            Max_Cycle_Length := Cycle_Length;
            Result_D := D;
         end if;
      end;
   end loop;

   Put_Line("The value of d < 1000 for which 1/d contains the longest recurring cycle is: " & Integer'Image(Result_D));
end Longest_Recurring_Cycle;