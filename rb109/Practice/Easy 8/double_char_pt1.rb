# double_char_pt1.rb

# write a method
# input: a string
# output: a new string in which every character is doubled

def repeater(string)
  repetitions = ''

  string.each_char { |char| repetitions << char * 2 }
  repetitions
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''