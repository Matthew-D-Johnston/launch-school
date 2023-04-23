# reverse_sentence.rb

# Modified Code:

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []
  
  i = 0
  while i < words.length
    reversed_words.unshift(words[i])
    i += 1
  end
  
  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')

puts '------'

# Launch School Solution:

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []
  
  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    i += 1
  end
  
  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
