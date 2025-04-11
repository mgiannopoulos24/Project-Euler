with Ada.Text_IO; use Ada.Text_IO;

procedure Power_Of_Two_Sum is
   MAX_DIGITS : constant := 302; -- Enough to store 2^1000
   type Digit_Array is array (1 .. MAX_DIGITS) of Integer;
   Result : Digit_Array := (others => 0);
   Size   : Integer := 1; -- Number of digits in the result

   procedure Multiply (Result : in out Digit_Array; Num : Integer; Size : in out Integer) is
      Carry : Integer := 0;
      Prod  : Integer;
   begin
      for I in 1 .. Size loop
         Prod := Result(I) * Num + Carry;
         Result(I) := Prod mod 10;
         Carry := Prod / 10;
      end loop;

      while Carry > 0 loop
         Size := Size + 1;
         Result(Size) := Carry mod 10;
         Carry := Carry / 10;
      end loop;
   end Multiply;

   Sum : Integer := 0;
begin
   Result(1) := 1; -- 2^0 = 1

   for I in 1 .. 1000 loop
      Multiply (Result, 2, Size);
   end loop;

   for I in 1 .. Size loop
      Sum := Sum + Result(I);
   end loop;

   Put_Line ("The sum of the digits of 2^1000 is: " & Integer'Image(Sum));
end Power_Of_Two_Sum;