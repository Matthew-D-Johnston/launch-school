# reverse_it.rb
# Write a method that takes one argument, a string, and returns a
# new string with the words in reverse order.

# Pseudo-code:
# Create a mirror image of a string by flipping it.
# First word will equal the last word.
# Need to split the string into individual words.
# Once split, the words can be placed in an array object.
# Then I can run a loop that takes the last element of the array and
# adds it to a string, each time the loop iterates a new word is added.

# Formal pseudo-code:
# START by defining method `reverse_sentence(string)`;
# READ the `string` and split it into individual words;
# SET the individual words in a new array;
# SET a new empty string variable;
# Perform an IF/ELSE loop;
# IF empty string variable is empty, take last word of array
# and assign it to the variable.
# ELSE take the last word of array and add it to the non-empty
# string.

def reverse_sentence(string)
  split_str = string.split

  empty_str = ""

  while split_str != []
    if empty_str == ""
      empty_str = split_str.pop
    else
      empty_str << " " + split_str.pop
    end
  end

  empty_str

end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'


puts "------"

# Launch School solution:

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'


