# control_the_loop.rb
# Modify the following loop so it iterates 5 times instead of just once.

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1             # my addition
  break if iterations > 5     # my addition
end
