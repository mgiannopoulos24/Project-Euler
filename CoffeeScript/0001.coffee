sumOfMultiples = (limit) ->
  sum = 0
  for i in [1...limit]
    if i % 3 is 0 or i % 5 is 0
      sum += i
  sum

limit = 1000

console.log(sumOfMultiples(limit))
