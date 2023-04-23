# staggered_caps_pt1.rb

# Write a method
# input: a string
# output: new string containing original value but with every other character
# capitalized and the remaining characters are lowercase.

def staggered_case(string)
  staggered_string = ''

  string.chars.each_with_index do |char, idx|
    if idx.even?
      staggered_string << char.upcase
    else
      staggered_string << char.downcase
    end
  end

  staggered_string
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
