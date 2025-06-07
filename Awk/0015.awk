# Function to compute binomial coefficient C(n, k)
function binomial_coefficient(n, k) {
    # Take advantage of symmetry: C(n, k) = C(n, n-k)
    if (k > n - k) {
        k = n - k
    }
    
    result = 1
    for (i = 0; i < k; i++) {
        result *= (n - i)
        result /= (i + 1)
    }
    
    return result
}

BEGIN {
    # Define grid size
    n = 40
    k = 20

    # Calculate binomial coefficient C(40, 20)
    result = binomial_coefficient(n, k)

    # Print the result
    printf "The number of routes through a 20x20 grid is: %d\n", result
}