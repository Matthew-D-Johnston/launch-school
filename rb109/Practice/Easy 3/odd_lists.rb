# odd_lists.rb

def oddities(arr)
  odd_list = []
  arr.each_with_index do |elem, idx|
    odd_list << elem if idx.even?
  end
  odd_list
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
