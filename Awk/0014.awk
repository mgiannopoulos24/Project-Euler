BEGIN {
    # Initialize variables
    max_chain_length = 0
    max_start = 0

    # Loop through all numbers from 1 to 999,999
    for (start = 1; start < 1000000; start++) {
        n = start
        chain_length = 1

        # Compute the chain length for the current starting number
        while (n != 1) {
            if (n in memo) {
                # If the chain length for n is already computed, reuse it
                chain_length += memo[n] - 1
                break
            }
            if (n % 2 == 0) {
                n = n / 2
            } else {
                n = 3 * n + 1
            }
            chain_length++
        }

        # Store the computed chain length in the memoization array
        memo[start] = chain_length

        # Update the maximum chain length and starting number if needed
        if (chain_length > max_chain_length) {
            max_chain_length = chain_length
            max_start = start
        }
    }

    # Print the result
    print "The starting number under one million that produces the longest chain is:", max_start
    print "The length of the chain is:", max_chain_length
}