# int_vs_ext_iterators.rb

factorial = Enumerator.new do |factorials|
  factorials << 1
  current_factorial = 1
  iteration = 1

  loop do
    current_factorial *= iteration
    factorials << current_factorial
    iteration += 1
  end
end

# External Iteration:

puts factorial.next
puts factorial.next
puts factorial.next
puts factorial.next
puts factorial.next
puts factorial.next
puts factorial.next

puts '-----'

# or,

factorial.rewind

7.times do
  puts factorial.next
end

puts '-----'

# Internal Iteration:

puts factorial.take(7)

puts '-----'

# or (Launch School's Internal Iteration):

factorial.rewind

factorial.each_with_index do |number, index|
  puts number
  break if index == 6
end

p factorial.class
p factorial
