# l5_pp_12.rb

# Practice Problem 12
# Given the following data structure, and without using the `Array#to_h`
# method, write some code that will return a hash where the key is the first
# item in each sub array and the avlue is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_hash = arr.each_with_object({}) do |sub_array, hsh|
  hsh[sub_array[0]] = sub_array[1]
end

p new_hash # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

puts '-----'

# Launch School solution:

hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
puts hsh
