# swap_case.rb

# Write a method
# input: a string
# output: new string with lowercase and uppercase characters swapped

UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def swapcase(string)
  swapcased_string = ''

  string.each_char do |char|
    if UPPERCASE.include?(char)
      swapcased_string << char.downcase
    elsif LOWERCASE.include?(char)
      swapcased_string << char.upcase
    else
      swapcased_string << char
    end
  end

  swapcased_string
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
        
