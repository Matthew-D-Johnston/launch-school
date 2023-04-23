# double_char1.rb
# Write a method that takes a string, and returns a new string in which every
# character is doubled.

def repeater(string)
  string.split('').map { |char| char * 2 }.join
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''

puts '-----'

# Launch School solution:

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
