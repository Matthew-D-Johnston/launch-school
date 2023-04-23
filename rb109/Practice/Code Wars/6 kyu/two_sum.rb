# two_sum.rb

def two_sum(numbers, target)
  indices = []
  
  numbers.each_with_index do |outer_item, outer_idx|
    numbers.each_with_index do |inner_item, inner_idx|
      unless outer_idx == inner_idx
        indices << outer_idx << inner_idx if (outer_item + inner_item) == target
      end
    end
  end
  
  indices[0, 2]
end

p two_sum([1, 2, 3], 4) == [0, 2]
p two_sum([1234, 5678, 9012], 14690) == [1, 2]
p two_sum([2, 2, 3], 4) == [0, 1]
p two_sum([65, 41, 61, 36, 13, 2, 44, 63, 70, 94, 53, 12, 64, 69, 93, 42, 22, 58, 99, 1, 40, 20, 29, 44, 95, 17, 35, 86, 58, 15, 89, 73, 2, 80, 92, 27, 14, 31, 23, 35, 3, 26, 66, 87, 77, 33, 36, 89, 70, 83, 21, 92, 68, 64, 32, 68, 74, 72, 13, 15, 86, 43, 86, 35, 65, 76, 40, 96, 70, 34, 87, 86, 12, 30, 8, 83], 96)
