# daily_double.rb

# write a method
# takes a string as input
# outputs a new string with all duplicate consecutive characters collapsed into
# a single character

# iterating through the string and storing each character as follows:
# current_char = char
# [] << char if current_char != last_char
# last_char = current_char

def crunch(duplicate_chars)
  last_char = ''
  crunched = []
  
  duplicate_chars.each_char do |char|
    crunched << char if char != last_char
    last_char = char
  end

  crunched.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
