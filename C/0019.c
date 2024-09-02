#include <stdio.h>

// Function to determine if a year is a leap year
int is_leap_year(int year) {
    return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
}

int main() {
    int sunday_count = 0;
    int day_of_week = 2; // 1 Jan 1901 was Tuesday, so day_of_week = 2

    // Days in each month for a normal year and a leap year
    int days_in_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
    for (int year = 1901; year <= 2000; year++) {
        for (int month = 0; month < 12; month++) {
            // Check if the first day of the month is a Sunday
            if (day_of_week == 0) { // 0 represents Sunday
                sunday_count++;
            }
            
            // Update the day of the week for the next month
            if (month == 1 && is_leap_year(year)) {
                day_of_week = (day_of_week + 29) % 7; // February in a leap year
            } else {
                day_of_week = (day_of_week + days_in_month[month]) % 7;
            }
        }
    }

    printf("Number of Sundays that fell on the first of the month during the 20th century: %d\n", sunday_count);
    
    return 0;
}
