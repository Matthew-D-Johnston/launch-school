# multiple_signatures.rb
# What do each of these `puts` statements output?

a = %w(a b c d e)                       # => ["a", "b", "c", "d", "e"]
# puts a.fetch(7)                         # => IndexError exception
puts a.fetch(7, 'beats me')             # => 'beats me'
puts a.fetch(7) { |index| index**2 }    # => 49

# Documentation found at: Array#fetch (http://ruby-doc.org/core-2.6.3/Array.html#method-i-fetch)
