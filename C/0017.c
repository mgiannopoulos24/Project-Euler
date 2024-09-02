#include <stdio.h>
#include <string.h>

// Function prototypes
void number_to_words(int num, char *words);
int count_letters(const char *str);

// Arrays for word representations
const char *units[] = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
const char *teens[] = {"", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
const char *tens[] = {"", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
const char *thousands[] = {"", "thousand"};
const char *hundreds[] = {"", "one hundred", "two hundred", "three hundred", "four hundred", "five hundred", "six hundred", "seven hundred", "eight hundred", "nine hundred"};

// Function to convert a number into words
void number_to_words(int num, char *words) {
    if (num == 1000) {
        strcpy(words, "one thousand");
        return;
    }

    words[0] = '\0'; // Initialize the string

    if (num >= 100) {
        int hundred = num / 100;
        strcat(words, hundreds[hundred]);
        num %= 100;
        if (num > 0) {
            strcat(words, " and ");
        }
    }

    if (num >= 20) {
        int ten = num / 10;
        strcat(words, tens[ten]);
        num %= 10;
        if (num > 0) {
            strcat(words, "-");
        }
    } else if (num >= 11) {
        strcat(words, teens[num - 10]);
        num = 0;
    } else if (num == 10) {
        strcat(words, tens[1]);
        num = 0;
    }

    if (num > 0) {
        strcat(words, units[num]);
    }
}

// Function to count letters in a string, excluding spaces and hyphens
int count_letters(const char *str) {
    int count = 0;
    while (*str) {
        if (*str != ' ' && *str != '-') {
            count++;
        }
        str++;
    }
    return count;
}

int main() {
    int total_letters = 0;
    char words[100];

    for (int i = 1; i <= 1000; i++) {
        number_to_words(i, words);
        total_letters += count_letters(words);
    }

    printf("Total letters used from 1 to 1000: %d\n", total_letters);

    return 0;
}
