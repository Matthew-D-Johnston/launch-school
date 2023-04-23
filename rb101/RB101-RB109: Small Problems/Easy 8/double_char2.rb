# double_char2.rb
# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a, e, i, o, u), digits, punctuation,
# and whitespace should not be doubled.

NON_VOWELS = ('b'..'d').to_a + ('f'..'h').to_a + ('j'..'n').to_a +
             ('p'..'t').to_a + ('v'..'z').to_a

def double_consonants(string)
  results = []
  string.chars.each do |char|
    results << if NON_VOWELS.include?(char.downcase)
                 char * 2
               else
                 char
               end
  end

  results.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""

puts '-------'

# Launch School

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""