BEGIN {
    # Days in each month (non-leap year)
    days_in_month[1] = 31;  # January
    days_in_month[2] = 28;  # February
    days_in_month[3] = 31;  # March
    days_in_month[4] = 30;  # April
    days_in_month[5] = 31;  # May
    days_in_month[6] = 30;  # June
    days_in_month[7] = 31;  # July
    days_in_month[8] = 31;  # August
    days_in_month[9] = 30;  # September
    days_in_month[10] = 31; # October
    days_in_month[11] = 30; # November
    days_in_month[12] = 31; # December

    # Start counting from 1 Jan 1900 (Monday = 1, Sunday = 7)
    current_day = 1

    # Count Sundays on the first of the month
    sunday_count = 0

    # Iterate through years 1900 to 2000
    for (year = 1900; year <= 2000; year++) {
        # Determine if the year is a leap year
        is_leap_year = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))
        if (is_leap_year) {
            days_in_month[2] = 29
        } else {
            days_in_month[2] = 28
        }

        # Iterate through months
        for (month = 1; month <= 12; month++) {
            # Check if the first day of the month is a Sunday
            if (current_day == 7 && year >= 1901) {
                sunday_count++
            }

            # Move to the first day of the next month
            current_day += days_in_month[month]
            current_day %= 7
            if (current_day == 0) {
                current_day = 7
            }
        }
    }

    # Print the result
    print sunday_count
}