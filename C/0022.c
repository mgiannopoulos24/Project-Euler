#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAMES 6000
#define MAX_NAME_LEN 100

// Function to calculate the alphabetical value of a name
int alphabetical_value(const char *name) {
    int value = 0;
    for (int i = 0; name[i] != '\0'; i++) {
        if (name[i] >= 'A' && name[i] <= 'Z') {
            value += (name[i] - 'A' + 1);
        }
    }
    return value;
}

// Comparison function for qsort
int compare(const void *a, const void *b) {
    return strcmp(*(const char **)a, *(const char **)b);
}

int main() {
    FILE *file = fopen("names.txt", "r");
    if (!file) {
        printf("Error: could not open file.\n");
        return 1;
    }

    // Reading names from the file
    char *names[MAX_NAMES];
    char buffer[MAX_NAME_LEN];
    int name_count = 0;
    
    while (fscanf(file, "\"%[^\"]\",", buffer) == 1) {
        names[name_count] = malloc(strlen(buffer) + 1);
        strcpy(names[name_count], buffer);
        name_count++;
    }
    
    fclose(file);

    // Sort the names alphabetically
    qsort(names, name_count, sizeof(char *), compare);

    // Calculate the total score
    unsigned long long total_score = 0;
    for (int i = 0; i < name_count; i++) {
        int name_value = alphabetical_value(names[i]);
        total_score += (name_value * (i + 1));  // Multiply by position (i+1)
    }

    // Free allocated memory
    for (int i = 0; i < name_count; i++) {
        free(names[i]);
    }

    // Output the result
    printf("Total score of all names: %llu\n", total_score);
    
    return 0;
}
