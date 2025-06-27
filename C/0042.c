#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_WORDS 2000
#define MAX_WORD_LEN 50
#define MAX_TRIANGLE 1000 // Sufficiently large upper limit

// Function to compute word value
int word_value(const char *word) {
    int value = 0;
    while (*word) {
        char c = toupper(*word);
        if (c >= 'A' && c <= 'Z') {
            value += (c - 'A' + 1);
        }
        word++;
    }
    return value;
}

// Function to check if a number is triangle using precomputed values
int is_triangle(int num, int *triangle_numbers, int max_n) {
    for (int i = 0; i < max_n; i++) {
        if (triangle_numbers[i] == num)
            return 1;
        if (triangle_numbers[i] > num)
            break;
    }
    return 0;
}

int main() {
    FILE *fp = fopen("words.txt", "r");
    if (!fp) {
        perror("Error opening file");
        return 1;
    }

    // Precompute triangle numbers up to t_100 (t_100 = 5050)
    int triangle_numbers[MAX_TRIANGLE];
    for (int n = 1; n < MAX_TRIANGLE; n++) {
        triangle_numbers[n - 1] = n * (n + 1) / 2;
    }

    char line[90000]; // Big enough to read entire file content
    if (fgets(line, sizeof(line), fp) == NULL) {
        printf("Error reading file.\n");
        fclose(fp);
        return 1;
    }
    fclose(fp);

    int count = 0;
    char *word = strtok(line, "\","); // Split by ",",
    while (word != NULL) {
        int value = word_value(word);
        if (is_triangle(value, triangle_numbers, MAX_TRIANGLE)) {
            count++;
        }
        word = strtok(NULL, "\",");
    }

    printf("Number of triangle words: %d\n", count);
    return 0;
}