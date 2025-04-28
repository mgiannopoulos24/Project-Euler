BEGIN {
    # Define the target sum
    target_sum = 1000

    # Iterate over possible values of a and b
    for (a = 1; a < target_sum / 3; a++) {
        for (b = a + 1; b < target_sum / 2; b++) {
            c = target_sum - a - b

            # Ensure c is greater than b (to avoid duplicates)
            if (c > b) {
                # Check if it forms a Pythagorean triplet
                if (a * a + b * b == c * c) {
                    print "The Pythagorean triplet is: a =", a, ", b =", b, ", c =", c
                    print "The product abc is:", a * b * c
                    exit 0  # Exit successfully
                }
            }
        }
    }

    # If no triplet is found
    print "No Pythagorean triplet found."
    exit 1  # Exit with failure
}