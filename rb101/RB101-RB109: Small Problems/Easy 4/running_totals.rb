# running_totals.rb
# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the
# original Array.

def running_total(array)
  running_total_array = []
  array.each_index { |i| running_total_array[i] = array[0..i].sum }
  running_total_array
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

puts '-----'

# Launch School solution:

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

puts '-----'

# Further Exploration:
# Try solving this problem using `Enumerable#each_with_object` or
# `Enumberable#inject` (note that `Enumerable` methods can be applied to
# Arrays). 

def running_total(array)
  sum = 0
  array.each_with_object([]) { |v, run_total| run_total << sum += v }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

puts '-----'

# ...or...

def running_total(array)
  run_total = []
  array.inject(0) do |sum, n| 
    run_total << sum + n
    sum + n
  end
  run_total
end

puts running_total([2, 5, 13])

