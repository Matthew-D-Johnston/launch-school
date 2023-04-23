# counting_number_of_chars.rb
# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a 
# character.

print "Please write word or multiple words: "
words = gets.chomp
total_characters = words.delete(' ').length

puts "There are #{total_characters} characters in \"#{words}\"."

# Launch School solution uses `size` instead of `length`.



