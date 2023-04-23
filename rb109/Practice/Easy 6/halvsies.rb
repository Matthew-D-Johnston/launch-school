# halvsies.rb

# write a method
# input: an array
# output: two arrays

def halvsies(arr)
  half_the_arr = arr.length / 2

  if arr.length.even?
    [arr[0..(half_the_arr - 1)], arr[half_the_arr..-1]]
  else
    [arr[0..half_the_arr], arr[(half_the_arr + 1)..-1]]
  end
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3])  == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
