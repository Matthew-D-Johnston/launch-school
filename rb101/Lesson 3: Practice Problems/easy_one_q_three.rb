# easy_one_q_three.rb
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

# My solution:

separate_words = advice.split
separate_words[separate_words.find_index('important')] = 'urgent'
rejoin_words = separate_words.join(' ')

puts rejoin_words

# Launch School solution:

advice.gsub!('important', 'urgent')






