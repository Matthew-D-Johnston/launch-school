# rotation_pt1.rb

# write a method 
# input: an array
# output: a new array with the first element of the original array moved to the
# end of the new array

def rotate_array(array)
  new_array = array[1..-1] << array[0]
end

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]