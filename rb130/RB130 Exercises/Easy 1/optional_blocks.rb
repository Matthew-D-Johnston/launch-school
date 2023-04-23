# optional_blocks.rb

def compute
  block_given? ? yield : 'Does not compute.'
end

# puts compute { 5 + 3 } == 8
# puts compute { 'a' + 'b' } == 'ab'
# puts compute == 'Does not compute.'

# Further Exploration:

def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

puts compute(3) { |n| 5 + n } == 8
puts compute('Hello') { |word| word + ' World' } == 'Hello World'
puts compute(2) == 'Does not compute.'
