sumEvenFibonacci = (limit) ->
  a = 1
  b = 2
  sum = 0

  while a <= limit
    if a % 2 == 0
      sum += a
    [a, b] = [b, a + b]

  sum

limit = 4000000

console.log "The sum of the even-valued terms is: #{sumEvenFibonacci(limit)}"
