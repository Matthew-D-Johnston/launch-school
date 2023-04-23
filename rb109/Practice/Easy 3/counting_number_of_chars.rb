# counting_number_of_chars.rb

print "Please write word or multiple words: "
words = gets.chomp

words_arr = words.split(' ')
total_chars = 0
words_arr.each { |word| total_chars += word.length }

puts "There are #{total_chars} characters in \"#{words}\"."

puts '----'

# or....

print "Please write word or multiple words: "
words = gets.chomp

total_chars = words.length - words.count(' ')

puts "There are #{total_chars} characters in \"#{words}\"."

puts '----'

