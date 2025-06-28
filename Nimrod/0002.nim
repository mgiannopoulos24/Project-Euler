var
  a: int64 = 1
  b: int64 = 2
  sumEven: int64 = 0

while a <= 4_000_000:
  if a mod 2 == 0:
    sumEven += a
  # Update Fibonacci numbers
  let nextB = a + b
  a = b
  b = nextB

echo "Sum of even-valued Fibonacci terms: ", sumEven