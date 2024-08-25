int sumOfMultiples(int limit) {
    int sum = 0;
    for (int i = 1; i < limit; i++) {
        if (i % 3 == 0 || i % 5 == 0) {
            sum += i;
        }
    }
    return sum;
}

int limit = 1000;
int sum = sumOfMultiples(limit);
System.out.println("The sum of all multiples of 3 or 5 below " + limit + " is: " + sum);