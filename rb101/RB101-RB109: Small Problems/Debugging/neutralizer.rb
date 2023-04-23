# neutralizer.rb

# Problem Code:

def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end
  
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
   ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')

puts '------'

# Modified Code:

def neutralize(sentence)
  words = sentence.split(' ')
  neutral_words = []
  words.each do |word|
    neutral_words << word unless negative?(word)
  end

  neutral_words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')

puts '-----'

# Launch School Solution:

def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
   ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')