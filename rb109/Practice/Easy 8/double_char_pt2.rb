# double_char_pt2.rb

# write a method
# input: takes a string
# output: returns a new string in which every consonant character is doubled

# anything not a vowel or non-alpha character

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a
VOWELS = %w(a e i o u A E I O U)

def double_consonants(string)
  doubled_cons = ''

  string.each_char do |char|
    if ALPHABET.include?(char)
      VOWELS.include?(char) ? doubled_cons << char : doubled_cons << char * 2
    else
      doubled_cons << char
    end
  end

  doubled_cons
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
