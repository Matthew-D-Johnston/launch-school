# medium_one_q_one.rb

(1..10).each { |i| puts "The Flintstones Rock!".rjust(20 + i) }

#...or...

for i in 1..10 do puts "The Flintstones Rock!".rjust(20 + i) end

# Launch School's solution:
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
