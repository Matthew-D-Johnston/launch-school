# staggered_caps2.rb
# Modify the method from the previous exercise so it ignores non_alphabectic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case.

# Pseudo-code:

# Data Structure:
# input: a string
# output: a string with every other letter (not character) capitalized
# rules:
# 1) non-alphabetic characters must still be included, but they do not count
# when toggling the desired case

# Algorithm:
# 1) begin by initializing the method definition: def staggered_case(string)
# 2) Will need to split the string into individual character array.
# 3) Will base this on iterating with an index, but will need to create my own
#    index and loop: index = 0; loop do
# 4) the logic of the loop:
# a) use a conditional that checks for alphabetical characters using something
#    like: include?(/[a-zA-Z]/); if true then take the character and either
#    upcase or downcase depending on whether the index count is even or odd;
#    then, add the character to a results string and increment the index by 1.
# b) however, if the character is not alphabetical, simply add it to the
#    pre-defined results string and make sure NOT to increment the index by 1.
# c) break out of the loop when the string size == the array size
# 5) Return the results string

def staggered_case(string)
  staggered = ''
  alpha_char_index = 0
  string.each_char do |char|
    if char =~ /[a-zA-Z]/
      staggered += char.upcase if alpha_char_index.even?
      staggered += char.downcase if alpha_char_index.odd?
      alpha_char_index += 1
    else
      staggered += char
    end
  end
  staggered
end

puts staggered_case("I Love Launch School!") == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

puts '-----'

# Launch School solution:

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

puts staggered_case("I Love Launch School!") == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

puts '-----'

# Further Exploration:
# Modify this method so the caller can determine whether non-alphabetic
# characters should be counted when determining the upper/lowercase state. That
# is, you want a method that can perform the same actions that this method
# does, or operates like the previous version.

def staggered_case(string, all_chars = false)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
      need_upper = !need_upper if all_chars
    end
  end
  result
end

puts staggered_case("I Love Launch School!", true)
puts staggered_case('ALL CAPS', true)
puts staggered_case('ignore 77 the 444 numbers', true)
