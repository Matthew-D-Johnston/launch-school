# joinor.rb
# Currently, in our Tic Tac Toe program, we are using the `Array#join` method,
# which can only inster a delimiter between the array elements, and isn't smart
# enough to display a joining word for the last element.

# Write a method called `joinor` that will display a joining word for the last
# element.

# Pseudo-code:

# Data Structure:
# input: 3 arguments: 1) an array of integers; 2) a joining punctuation mark;
# and 3) the word to join the last two elements.
# output: a string representation of the integers separated by a space and
# comma and where the last two elements are separated by a comma, a space, the
# final joining word, and then another space (i.e. ...', or '...)

# Algorithm
# 1) initialize the method definition: def joinor(list, punctuation, last_word)
# 2) begin by grabbing the last element of the list: last_element = list.last
# 3) then combine all elements of the list except the last one using join,
#    where punctuation is the argument passed to the join method; also then add
#    the punctuation, the last_word, and the last_element:
#    "#{list[0..-2].join(punctuation)#{punctuation}#{last_word} #{last_element}"

def joinor(list, punctuation = ', ', last_word = 'or')
  last_element = list.last
  punctuation = ' ' if list.size == 2
  if list.size == 1
    last_element.to_s
  else
    "#{list[0..-2].join(punctuation)}#{punctuation}#{last_word} #{last_element}"
  end
end

puts joinor([1, 2]) == "1 or 2"
puts joinor([1, 2, 3]) == "1, 2, or 3"
puts joinor([1, 2, 3], '; ') == "1; 2; or 3"
puts joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"

puts "-----"


# Launch School solution:

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

puts joinor([1, 2]) == "1 or 2"
puts joinor([1, 2, 3]) == "1, 2, or 3"
puts joinor([1, 2, 3], '; ') == "1; 2; or 3"
puts joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"
