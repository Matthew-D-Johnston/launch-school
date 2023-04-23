# reverse_it.rb

def reverse_sentence(string)
  words = string.split
  reversed_words = []

  until words.empty?
    reversed_words << words.pop
  end

  reversed_words.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

puts '----'

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
