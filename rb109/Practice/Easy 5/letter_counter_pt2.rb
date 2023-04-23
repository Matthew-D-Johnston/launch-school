# letter_counter_pt2.rb

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

def word_sizes(string)
  counter_hash = Hash.new(0)

  string.split.each do |word|
    word_length = 0
    word.each_char do |char|
      word_length += 1 if ALPHABET.include?(char)
    end
    counter_hash[word_length] += 1
  end

  counter_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
