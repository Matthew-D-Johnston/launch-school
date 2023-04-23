# whats_wrong_with_output.rb

arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y| 
  y.to_i <=> x.to_i
end

puts '-----'


# Modified Code:

p arr.sort { |x, y| y.to_i <=> x.to_i }

puts '------'

# Launch School's Solution

p (
  arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
)
