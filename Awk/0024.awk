function factorial(n,    i, result) {
    result = 1
    for (i = 2; i <= n; i++) result *= i
    return result
}

BEGIN {
    # Digits to permute
    split("0 1 2 3 4 5 6 7 8 9", digits, " ")
    size = length(digits)
    n = (n ? n : 1000000) - 1  # Default to 1,000,000th if not set, 0-indexed

    for (i = 1; i <= size; i++) remaining[i] = digits[i]

    for (i = 1; i <= size; i++) {
        fact = factorial(size - i)
        idx = int(n / fact) + 1  # AWK arrays are 1-based
        printf "%s", remaining[idx]

        # Remove used digit
        for (j = idx; j < size - i + 1; j++) remaining[j] = remaining[j + 1]

        n = n % fact
    }
    printf "\n"
}