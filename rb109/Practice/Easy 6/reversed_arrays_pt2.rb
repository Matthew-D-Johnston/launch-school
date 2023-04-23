# reversed_arrays_pt2.rb

# write a method
# input: an array
# output: new array with the elements of original list in reverse order

def reverse(arr)
  new_arr = []
  idx = arr.length - 1

  while idx >= 0
    new_arr << arr[idx]
    idx -= 1
  end

  new_arr
end

p reverse([1,2,3,4]) == [4, 3, 2, 1]
p reverse(%w(a b e d c)) == %w(c d e b a)
p reverse(['abc']) == ['abc']
p reverse([]) == []

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
