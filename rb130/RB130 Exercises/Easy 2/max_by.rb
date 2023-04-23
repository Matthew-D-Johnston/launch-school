# max_by.rb

def max_by(array)
  return nil if array.empty?

  max_index = nil
  current_value = nil

  array.each_with_index do |elem, index|
    if index == 0
      current_value = yield(elem)
      max_index = index
    elsif yield(elem) > current_value
      current_value = yield(elem)
      max_index = index
    end
  end
  
  array[max_index]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil

