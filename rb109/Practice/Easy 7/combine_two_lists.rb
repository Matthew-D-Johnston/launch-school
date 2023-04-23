# combine_two_lists.rb

# Write a method
# input: two separate arrays
# output: all elements from both arrays, taken in alternation.

def interleave(arr1, arr2)
  combined_arr = []

  0.upto(arr1.length - 1) do |idx|
    combined_arr << arr1[idx] << arr2[idx]
  end

  combined_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
