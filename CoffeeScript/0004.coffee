# Function to check if a number is a palindrome
isPalindrome = (num) ->
  str = num.toString()
  str == str.split('').reverse().join('')

# Function to find the largest palindrome
largestPalindrome = ->
  maxPalindrome = 0
  for i in [999..100] by -1
    for j in [i..100] by -1
      product = i * j
      # Skip if the product is smaller than the largest palindrome found
      break if product <= maxPalindrome
      # Update maxPalindrome if the product is a palindrome
      maxPalindrome = product if isPalindrome(product)
  maxPalindrome

# Run the function and print the result
console.log "The largest palindrome made from the product of two 3-digit numbers is: #{largestPalindrome()}"