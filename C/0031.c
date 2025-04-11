#include <stdio.h>

#define MAX_AMOUNT 200 // £2 in pence

int main() {
    // Define the coin denominations in pence
    int coins[] = {1, 2, 5, 10, 20, 50, 100, 200};
    int num_coins = sizeof(coins) / sizeof(coins[0]);

    // Initialize the dp array
    long long dp[MAX_AMOUNT + 1];
    for (int i = 0; i <= MAX_AMOUNT; i++) {
        dp[i] = 0;
    }
    dp[0] = 1; // There is 1 way to make 0 pence (using no coins)

    // Fill the dp array using the coin denominations
    for (int i = 0; i < num_coins; i++) {
        for (int j = coins[i]; j <= MAX_AMOUNT; j++) {
            dp[j] += dp[j - coins[i]];
        }
    }

    // Output the result
    printf("The number of ways to make £2 is: %lld\n", dp[MAX_AMOUNT]);

    return 0;
}