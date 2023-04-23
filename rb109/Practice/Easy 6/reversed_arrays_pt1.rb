# reversed_arrays_pt1.rb

# write a method:
# input: takes an array as an argument
# output: same array object but the returned value has the elements in reverse
# order

def reverse!(arr)
  start_of_arr = 0
  end_of_arr = arr.length - 1

  if end_of_arr > 0
    loop do
      arr[start_of_arr], arr[end_of_arr] = arr[end_of_arr], arr[start_of_arr]
      break if end_of_arr - start_of_arr == 1 || end_of_arr - start_of_arr == 2
      start_of_arr += 1
      end_of_arr -= 1    
    end
  end

  arr
end

list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

p list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

p list = []
p reverse!(list) == []
p list == []

p list = [1, 2]
p reverse!(list) == [2, 1]
p list == [2, 1]
