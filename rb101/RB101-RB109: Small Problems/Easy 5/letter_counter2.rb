# letter_counter2.rb
# Modify the `word_sizes` method from the previous exercise to exclude non-
# letters when determining word size. For instance, the length of `"it's"` is
# 3, not 4.

def word_sizes(sentence)
  words = sentence.split

  word_size_array = words.map do |word|
    word.gsub!(/[^a-z]/i, '')
    word.size
  end

  word_size_hash = Hash.new(0)
  word_size_array.each { |size| word_size_hash[size] += 1 }
  word_size_hash
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}

puts '-----'

# Launch School solution:

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
