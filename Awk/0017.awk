BEGIN {
    # Define word lengths for numbers 1-19
    ones[1] = 3; # one
    ones[2] = 3; # two
    ones[3] = 5; # three
    ones[4] = 4; # four
    ones[5] = 4; # five
    ones[6] = 3; # six
    ones[7] = 5; # seven
    ones[8] = 5; # eight
    ones[9] = 4; # nine
    ones[10] = 3; # ten
    ones[11] = 6; # eleven
    ones[12] = 6; # twelve
    ones[13] = 8; # thirteen
    ones[14] = 8; # fourteen
    ones[15] = 7; # fifteen
    ones[16] = 7; # sixteen
    ones[17] = 9; # seventeen
    ones[18] = 8; # eighteen
    ones[19] = 8; # nineteen

    # Define word lengths for tens (20, 30, ..., 90)
    tens[2] = 6; # twenty
    tens[3] = 6; # thirty
    tens[4] = 5; # forty
    tens[5] = 5; # fifty
    tens[6] = 5; # sixty
    tens[7] = 7; # seventy
    tens[8] = 6; # eighty
    tens[9] = 6; # ninety

    # Special words
    hundred = 7; # "hundred"
    and = 3;     # "and"
    thousand = 8; # "thousand"

    # Initialize total letter count
    total_letters = 0;

    # Loop through numbers 1 to 1000
    for (num = 1; num <= 1000; num++) {
        if (num == 1000) {
            # Handle "one thousand"
            total_letters += ones[1] + thousand;
        } else if (num >= 100) {
            # Handle hundreds
            hundreds_digit = int(num / 100);
            remainder = num % 100;

            # Add "hundred" and the word for the hundreds digit
            total_letters += ones[hundreds_digit] + hundred;

            if (remainder > 0) {
                # Add "and" and the word for the remainder
                total_letters += and;
                if (remainder < 20) {
                    total_letters += ones[remainder];
                } else {
                    tens_digit = int(remainder / 10);
                    units_digit = remainder % 10;
                    total_letters += tens[tens_digit];
                    if (units_digit > 0) {
                        total_letters += ones[units_digit];
                    }
                }
            }
        } else if (num >= 20) {
            # Handle tens
            tens_digit = int(num / 10);
            units_digit = num % 10;
            total_letters += tens[tens_digit];
            if (units_digit > 0) {
                total_letters += ones[units_digit];
            }
        } else {
            # Handle numbers 1-19
            total_letters += ones[num];
        }
    }

    # Print the result
    print total_letters;
}