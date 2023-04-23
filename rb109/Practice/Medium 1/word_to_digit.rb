# word_to_digit.rb

WORDS_TO_DIGITS = { 'zero' => '0', 'one' => '1', 'two' => '2',
                    'three' => '3', 'four' => '4', 'five' => '5',
                    'six' => '6', 'seven' => '7', 'eight' => '8',
                    'nine' => '9', 'ten' => '10'
                  }

def word_to_digit(string)
  new_string = string
  WORDS_TO_DIGITS.keys.each do |digit|
    new_string = new_string.gsub(digit, WORDS_TO_DIGITS[digit])
    new_string = new_string.gsub(digit.capitalize, WORDS_TO_DIGITS[digit])
  end
  new_string
end

str = 'Please call me at five five five one two three four. Thanks.'
puts word_to_digit(str)
puts str

puts '-----'

str = 'Please call me at five five five one two three Four. Thanks.'
puts word_to_digit(str)
puts str
