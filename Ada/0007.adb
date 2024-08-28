with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Prime_Number is
   -- Function to check if a number is prime
   function Is_Prime (Num : Integer) return Boolean is
      I : Integer;
   begin
      if Num <= 1 then
         return False;
      elsif Num = 2 then
         return True;
      elsif Num mod 2 = 0 then
         return False;
      end if;

      I := 3;
      while I * I <= Num loop
         if Num mod I = 0 then
            return False;
         end if;
         I := I + 2;
      end loop;

      return True;
   end Is_Prime;

   Count   : Integer := 0;
   Number  : Integer := 1;
   Target  : Integer := 10001;
begin
   -- Find the 10001st prime number
   while Count < Target loop
      Number := Number + 1;
      if Is_Prime(Number) then
         Count := Count + 1;
      end if;
   end loop;

   -- Print the result
   Put_Line("The " & Integer'Image(Target) & "th prime number is " & Integer'Image(Number));
end Prime_Number;
