void main() {
  // Initialize the first two terms of the Fibonacci sequence
  int a = 1;
  int b = 2;
  int sum = 0;
  const int limit = 4000000;

  // Iterate until the terms exceed four million
  while (a <= limit) {
    // Check if the term is even
    if (a % 2 == 0) {
      sum += a;
    }

    // Generate the next Fibonacci number
    int next = a + b;
    a = b;
    b = next;
  }

  // Print the sum of the even-valued terms
  print('The sum of the even-valued terms is: $sum');
}
