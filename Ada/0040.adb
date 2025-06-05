with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Champernowne_Constant is
   -- Function to calculate the digit at a specific position in Champernowne's constant
   function Find_Digit(Position : Positive) return Natural is
      Remaining_Position : Natural := Position;
      Digits_Per_Number  : Natural := 1;
      Num_Count          : Natural := 9;
      Start_Number       : Natural := 1;
      Current_Block_Size : Natural;
   begin
      -- Iterate through blocks of numbers with the same number of digits
      loop
         Current_Block_Size := Digits_Per_Number * Num_Count;
         
         -- Check if the position falls within the current block
         if Remaining_Position <= Current_Block_Size then
            -- Calculate which number contains our digit
            declare
               Offset_Within_Block : Natural := Remaining_Position - 1;
               Number_Index        : Natural := Offset_Within_Block / Digits_Per_Number;
               Position_In_Number  : Natural := Offset_Within_Block mod Digits_Per_Number;
               Target_Number       : Natural := Start_Number + Number_Index;
               Digit_Position      : Natural := Digits_Per_Number - Position_In_Number - 1;
               Result              : Natural := Target_Number;
            begin
               -- Extract the specific digit from the number
               for I in 0 .. Digit_Position - 1 loop
                  Result := Result / 10;
               end loop;
               return Result mod 10;
            end;
         end if;
         
         -- Move to the next block
         Remaining_Position := Remaining_Position - Current_Block_Size;
         Start_Number := Start_Number * 10;
         Digits_Per_Number := Digits_Per_Number + 1;
         Num_Count := Num_Count * 10;
      end loop;
   end Find_Digit;
   
   -- Positions to calculate
   Positions : constant array (1 .. 7) of Positive := (1, 10, 100, 1_000, 10_000, 100_000, 1_000_000);
   Product   : Long_Integer := 1;
   Digit     : Natural;
begin
   Put_Line("Champernowne's constant digit finder");
   Put_Line("----------------------------------");
   
   for Pos of Positions loop
      Digit := Find_Digit(Pos);
      Put("d_");
      Put(Pos, 0);
      Put(" = ");
      Put(Digit, 0);
      New_Line;
      
      Product := Product * Long_Integer(Digit);
   end loop;
   
   New_Line;
   Put("The product d_1 × d_10 × d_100 × d_1000 × d_10000 × d_100000 × d_1000000 = ");
   Put(Integer(Product), 0);
   New_Line;
end Champernowne_Constant;