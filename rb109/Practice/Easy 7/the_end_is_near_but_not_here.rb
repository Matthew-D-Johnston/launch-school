# the_end_is_near_but_not_here.rb

# Write a method
# input: a string
# output: the next to last word

def penultimate(string)
  string.split[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
