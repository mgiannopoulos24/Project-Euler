function collatzSequenceLength(n: number, memo: Map<number, number>): number {
    if (n === 1) return 1; // Base case: chain length for 1 is 1
    if (memo.has(n)) return memo.get(n)!; // Return cached result if available

    let next: number;
    if (n % 2 === 0) {
        next = n / 2; // Rule for even numbers
    } else {
        next = 3 * n + 1; // Rule for odd numbers
    }

    // Recursively compute the chain length and store it in the memo
    const length = 1 + collatzSequenceLength(next, memo);
    memo.set(n, length);
    return length;
}

function findLongestCollatzChain(limit: number): { number: number; length: number } {
    const memo = new Map<number, number>(); // Memoization map
    let maxLength = 0;
    let numberWithMaxLength = 0;

    for (let i = 1; i < limit; i++) {
        const length = collatzSequenceLength(i, memo);
        if (length > maxLength) {
            maxLength = length;
            numberWithMaxLength = i;
        }
    }

    return { number: numberWithMaxLength, length: maxLength };
}

// Solve the problem for numbers under one million
const result = findLongestCollatzChain(1_000_000);
console.log(`The starting number under one million that produces the longest chain is ${result.number}, with a chain length of ${result.length}.`);