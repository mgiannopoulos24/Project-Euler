with Ada.Text_IO; use Ada.Text_IO;

procedure Sum_Of_Digits_In_Factorial is

   -- Maximum size of the array to store the large number (factorial)
   Max_Size : constant := 500;

   -- Define an array type to store digits of the factorial
   type Integer_Array is array (Natural range <>) of Integer;

   -- Procedure to multiply a large number by an integer
   procedure Multiply(Result : in out Integer_Array; Size : in out Natural; N : Integer) is
      Carry : Integer := 0;
      Product : Integer;
   begin
      -- Multiply each digit of the number by N and handle carry
      for I in 0 .. Size - 1 loop
         Product := Result(I) * N + Carry;
         Result(I) := Product mod 10; -- Store last digit of product in result
         Carry := Product / 10;       -- Carry is the rest
      end loop;

      -- Handle remaining carry
      while Carry > 0 loop
         Result(Size) := Carry mod 10;
         Carry := Carry / 10;
         Size := Size + 1;
      end loop;
   end Multiply;

   -- Function to calculate the factorial and sum the digits
   function Sum_Of_Digits_In_Factorial(N : Integer) return Integer is
      Result : Integer_Array(0 .. Max_Size - 1) := (others => 0);
      Size : Natural := 1; -- Size of the number in the result array
      Sum : Integer := 0;
   begin
      Result(0) := 1; -- Initial factorial value for 0! or 1!

      -- Compute factorial
      for I in 2 .. N loop
         Multiply(Result, Size, I);
      end loop;

      -- Calculate the sum of the digits
      for I in 0 .. Size - 1 loop
         Sum := Sum + Result(I);
      end loop;

      return Sum;
   end Sum_Of_Digits_In_Factorial;

   -- Variable to store the input number and the result
   N : Integer := 100;
   Result : Integer;

begin
   -- Calculate the sum of the digits in the factorial of N
   Result := Sum_Of_Digits_In_Factorial(N);

   -- Print the result
   Put_Line("The sum of the digits in the number " & Integer'Image(N) & "! is: " &
            Integer'Image(Result));
end Sum_Of_Digits_In_Factorial;