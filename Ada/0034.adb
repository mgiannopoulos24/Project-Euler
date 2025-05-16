with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Factorions is
   -- Precompute factorials for digits 0-9
   Factorials : constant array (0..9) of Integer :=
     (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880);
   
   function Is_Factorion(N : Integer) return Boolean is
      Sum : Integer := 0;
      Temp : Integer := N;
   begin
      while Temp > 0 loop
         Sum := Sum + Factorials(Temp mod 10);
         Temp := Temp / 10;
      end loop;
      return Sum = N;
   end Is_Factorion;
   
   Sum_Total : Integer := 0;
   Upper_Bound : constant Integer := 100000; -- Safe upper bound
begin
   for N in 10..Upper_Bound loop
      if Is_Factorion(N) then
         Put_Line("Found factorion: " & Integer'Image(N));
         Sum_Total := Sum_Total + N;
      end if;
   end loop;
   
   Put_Line("The sum of all factorions is:");
   Put(Sum_Total);
   New_Line;
end Factorions;