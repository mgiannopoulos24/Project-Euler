// Function to find the largest prime factor
int largestPrimeFactor(int n) {
  int largest = 0;

  // Remove all factors of 2
  while (n % 2 == 0) {
    largest = 2;
    n ~/= 2; // Integer division
  }

  // Remove all factors of odd numbers
  for (int i = 3; i * i <= n; i += 2) {
    while (n % i == 0) {
      largest = i;
      n ~/= i; // Integer division
    }
  }

  // If n is a prime number greater than 2
  if (n > 2) {
    largest = n;
  }

  return largest;
}

void main() {
  int number = 600851475143;
  int result = largestPrimeFactor(number);
  
  print('The largest prime factor of $number is $result');
}
