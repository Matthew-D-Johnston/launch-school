# l5_pp_1.rb

# Practice Problem 1
# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# My solution:

p arr.sort_by { |str| str.to_i }.reverse

puts '-----'

# Launch School solution:

arr1 = arr.sort do |a, b|
    b.to_i <=> a.to_i
end


