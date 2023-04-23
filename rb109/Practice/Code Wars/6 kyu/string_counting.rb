# string_counting.rb

def string_counter(string)
  alphabet = ('A'..'Z').to_a
  alphabet_strings = alphabet
  possible_strings = []

  (string.length - 1).times do
    possible_strings = []
    alphabet_strings.each do |alpha_str|
      alphabet.each do |letter|
        possible_strings << alpha_str + letter
      end
    end

    alphabet_strings = possible_strings
  end

  possible_strings.count do |str|
    str > string && str.reverse > string.reverse
  end
end

p string_counter('XYZ')
p string_counter('ABC')
p string_counter('ABCDE')



