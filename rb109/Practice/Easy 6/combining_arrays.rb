# combining_arrays.rb

def merge(arr1, arr2)
  [arr1, arr2].flatten.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


def merge(array_1, array_2)
  array_1 | array_2
end

p merge([1, 3, 3], [5, 6, 9])
