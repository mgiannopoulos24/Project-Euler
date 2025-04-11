with Ada.Text_IO; use Ada.Text_IO;

procedure Count_Sundays is

   -- Function to determine if a year is a leap year
   function Is_Leap_Year(Year : Integer) return Boolean is
   begin
      return (Year mod 4 = 0 and then (Year mod 100 /= 0 or else Year mod 400 = 0));
   end Is_Leap_Year;

   -- Days in each month for a normal year
   Days_In_Month : constant array (0 .. 11) of Integer :=
     (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

   Sunday_Count  : Integer := 0;
   Day_Of_Week   : Integer := 2; -- 1 Jan 1901 was Tuesday, so day_of_week = 2

begin
   -- Loop through each year from 1901 to 2000
   for Year in 1901 .. 2000 loop
      for Month in 0 .. 11 loop
         -- Check if the first day of the month is a Sunday
         if Day_Of_Week = 0 then -- 0 represents Sunday
            Sunday_Count := Sunday_Count + 1;
         end if;

         -- Update the day of the week for the next month
         if Month = 1 and then Is_Leap_Year(Year) then
            Day_Of_Week := (Day_Of_Week + 29) mod 7; -- February in a leap year
         else
            Day_Of_Week := (Day_Of_Week + Days_In_Month(Month)) mod 7;
         end if;
      end loop;
   end loop;

   -- Print the result
   Put_Line("Number of Sundays that fell on the first of the month during the 20th century: " &
            Integer'Image(Sunday_Count));

end Count_Sundays;