# greeting_a_user.rb

print "What is your name? "
user_name = gets.chomp

if user_name[-1] == '!'
  puts "HELLO #{user_name[0..-2].upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{user_name}."
end
