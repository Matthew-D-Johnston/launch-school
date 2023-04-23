# greeting_a_user.rb
# Write a program that will ask for user's name. The program will then greet
# the user. If the user writes "name!" then the computer yells back to the
# user.

puts "What is your name?"
name = gets.chomp

if name.split('').last != "!"
  puts "Hello #{name}."
else
  yeller_name = name.split('')
  yeller_name.pop
  puts "HELLO #{yeller_name.join.upcase}. WHY ARE WE SCREAMING?"
end

puts "--------"

# Launch School solution:

print 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

puts "--------"

# Further Exploration:
# Try modifying our solution to use `String#chomp!` and `String#chop!`

print 'What is your name? '
name = gets.chomp!

if name[-1] == '!'
  name = name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

