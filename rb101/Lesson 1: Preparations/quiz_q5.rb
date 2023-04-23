# quiz_q5.rb


# A.

def string_lengths(sentence)
  strings = sentence.split

  strings.map { |chars| chars.length }
end

p string_lengths("hello")                # => [5] (Correct)
p string_lengths("How are you today?")   # => [3, 3, 3, 6] (Correct, although included '?' as part of last word)


# B.

def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end
end

p string_lengths("hello")                # => ["hello"] (Incorrect)
p string_lengths("How are you today?")   # => ["How", "are", "you", "today?"] (Incorrect)

# C.

def string_lengths(sentence)
  words = sentence.split
  word_lengths = []
  counter = 0

  while counter < words.size do 
    word_lengths << words[counter].length
    counter += 1
  end

  word_lengths
end

p string_lengths("hello")                # => [5] (Correct)
p string_lengths("How are you today?")   # => [3, 3, 3, 6] (Correct, with similar qualification as in 'A')


# D.

def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size do 
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

p string_lengths("hello")                # => [] (Incorrect)
p string_lengths("How are you today?")   # => [3, 3, 3] (Incorrect)








