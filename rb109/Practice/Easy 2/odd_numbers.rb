# odd_numbers.rb

1.upto(99) { |num| puts num if num.odd? }

puts '------'

# or

1.upto(99) { |num| puts num if num % 2 == 1 }

puts "------"

# or

(1..99).to_a.each { |num| puts num if num.odd? }