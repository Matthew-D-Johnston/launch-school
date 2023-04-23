# mandatory_blocks.rb
# The Array#bsearch method is used to search ordered `Array`s more quickly
# than `#find` and `#select` can. Assume you have the following code:

a = [1, 4, 8, 11, 15, 19]

# How would you search this `Array` to find the first element whose value
# exceeds `8`?

puts a.bsearch { |x| x > 8 }

# Found documentation here: http://ruby-doc.org/core-2.6.3/Array.html#method-i-bsearch