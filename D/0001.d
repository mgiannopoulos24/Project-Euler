import std.stdio;

long sumOfMultiples(int limit) {
    long sum = 0;
    for (int i = 0; i < limit; i++) {
        if (i % 3 == 0 || i % 5 == 0) {
            sum += i;
        }
    }
    return sum;
}

void main() {
    int limit = 1000;
    writeln("The sum of all multiples of 3 or 5 below ", limit, " is: ", sumOfMultiples(limit));
}
