# easy_one_q_six.rb
# Strating with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and" in front of it.

puts "Four score and " << famous_words # => "Four score and seven years ago..."
puts "Four score and " + famous_words  # => "Four score and seven years ago..."

# Launch School's Solution:

puts famous_words.prepend("Four score and ") # "Four score and seven years ago..."


