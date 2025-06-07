BEGIN {
    # Define the triangle as an array of rows
    triangle[1] = "75"
    triangle[2] = "95 64"
    triangle[3] = "17 47 82"
    triangle[4] = "18 35 87 10"
    triangle[5] = "20 04 82 47 65"
    triangle[6] = "19 01 23 75 03 34"
    triangle[7] = "88 02 77 73 07 63 67"
    triangle[8] = "99 65 04 28 06 16 70 92"
    triangle[9] = "41 41 26 56 83 40 80 70 33"
    triangle[10] = "41 48 72 33 47 32 37 16 94 29"
    triangle[11] = "53 71 44 65 25 43 91 52 97 51 14"
    triangle[12] = "70 11 33 28 77 73 17 78 39 68 17 57"
    triangle[13] = "91 71 52 38 17 14 91 43 58 50 27 29 48"
    triangle[14] = "63 66 04 68 89 53 67 30 73 16 69 87 40 31"
    triangle[15] = "04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

    # Split the last row into an array for dynamic programming
    split(triangle[15], dp)

    # Process the triangle from the second-to-last row upwards
    for (row = 14; row >= 1; row--) {
        split(triangle[row], current_row)
        for (i = 1; i <= length(current_row); i++) {
            # Update dp[i] to be the maximum sum path through current_row[i]
            dp[i] = current_row[i] + (dp[i] > dp[i + 1] ? dp[i] : dp[i + 1])
        }
    }

    # The result is stored in dp[1], which represents the maximum path sum
    print dp[1]
}