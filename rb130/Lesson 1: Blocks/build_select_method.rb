# build_select_method.rb

def select(array)
  counter = 0
  results_array = []

  while counter < array.size
    results_array << array[counter] if yield(array[counter])
    counter += 1
  end

  results_array
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? } == [1, 3, 5]
p select(array) { |num| puts num } == []
p select(array) { |num| num + 1 } == [1, 2, 3, 4, 5]