# Write a method
# input: takes a single string
# output: new string with original value but with first character of every word
# capitalized

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word')  == 'This Is A "quoted" Word'
