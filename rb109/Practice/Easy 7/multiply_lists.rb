# multiply_lists.rb

# write a method
# input: two arrays, each containing a list of numbers
# output: a new array containing the product of each pair of numbers from the
# arguments that have the same index

def multiply_list(list1, list2)
  results = []

  0.upto(list1.length - 1) do |idx|
    results << (list1[idx] * list2[idx])
  end

  results
end

p multiply_list([3, 5, 7], [9, 10, 11])  == [27, 50, 77]
