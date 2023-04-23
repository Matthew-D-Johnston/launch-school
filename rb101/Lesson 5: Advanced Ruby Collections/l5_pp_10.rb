# l5_pp_10.rb

# Practice Problem 10
# Given the following data structure and without modifying the original array,
# use the `map` method to return a new array identical in structure to the
# original but where the value of each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# My response:

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hash|
  current_hash = {}
  hash.each_pair do |key, value|
    current_hash[key] = value + 1
  end
  current_hash
end

p new_arr # => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# Launch School solution:
# similar to mine

