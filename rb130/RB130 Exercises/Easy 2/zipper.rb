# zipper.rb

def zip(arr1, arr2)
  index_end = arr1.size - 1
  (0..index_end).to_a.map { |idx| [arr1[idx], arr2[idx]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

