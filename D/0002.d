import std.stdio;

void main() {
    // Initialize the first two terms of the Fibonacci sequence
    ulong a = 1;
    ulong b = 2;
    ulong sum = 0;

    // Iterate until the terms exceed four million
    while (a <= 4000000) {
        // Check if the term is even
        if (a % 2 == 0) {
            sum += a;
        }

        // Generate the next Fibonacci number
        ulong next = a + b;
        a = b;
        b = next;
    }

    // Print the sum of the even-valued terms
    writeln("The sum of the even-valued terms is: ", sum);
}
