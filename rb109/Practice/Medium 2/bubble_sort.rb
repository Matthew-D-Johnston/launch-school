# bubble_sort.rb

# write a method:
# input: an array
# output: a sorted array (sorted using the bubble sort alglorithm)

# Problem:
# 1) isolate each element and compare it with the previous element, swapping the
# elements if the first one is greater than the second (Basic Swapping Algo)

# 2) need to loop through the Basic Swapping Algo
#    need to run the BSA loop over until no more swaps are being made
#    create a number_of_swaps = 0
#    then run the BSA loop
#    break if number_of_swaps == 0
#    then return the array

# Basic Swapping Algorithm:
# until idx2 == array.size
#   if array[idx1] > array[idx2]
#     array[idx1], array[idx2] = array[idx2], array[idx1]
#     number_of_swaps += 1
#   end
#   idx1 += 1
#   idx2 += 2
# end


def bubble_sort!(array)
  loop do
    number_of_swaps = 0
    idx1 = 0
    idx2 = 1

    until array[idx2] == nil
      if array[idx1] > array[idx2]
        array[idx1], array[idx2] = array[idx2], array[idx1]
        number_of_swaps += 1
      end
      idx1 += 1
      idx2 += 1
    end

    break if number_of_swaps == 0
  end

  array
end

p array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
