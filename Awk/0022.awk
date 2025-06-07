BEGIN {
    # Read the entire file into a single string
    getline names < "names.txt"

    # Remove double quotes and split into an array of names
    gsub(/"/, "", names)  # Remove all double quotes
    n = split(names, name_array, ",")  # Split names into an array

    # Precompute alphabetical values for A-Z
    for (i = 1; i <= 26; i++) {
        char_value[sprintf("%c", 64 + i)] = i  # Map 'A' to 1, 'B' to 2, ..., 'Z' to 26
    }

    # Sort the names alphabetically using quicksort
    quicksort(name_array, 1, n)

    # Calculate the total score
    total_score = 0
    for (i = 1; i <= n; i++) {
        name = name_array[i]
        alphabetical_value = 0

        # Compute the alphabetical value of the name
        for (j = 1; j <= length(name); j++) {
            char = substr(name, j, 1)
            alphabetical_value += char_value[char]
        }

        # Compute the score for the name
        score = alphabetical_value * i
        total_score += score
    }

    # Print the result
    print total_score
}

# Quicksort implementation
function quicksort(arr, left, right) {
    if (left >= right) return
    pivot = arr[int((left + right) / 2)]
    i = left
    j = right
    while (i <= j) {
        while (arr[i] < pivot) i++
        while (arr[j] > pivot) j--
        if (i <= j) {
            temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
            i++
            j--
        }
    }
    quicksort(arr, left, j)
    quicksort(arr, i, right)
}