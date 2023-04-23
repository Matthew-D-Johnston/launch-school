# map.rb

require 'set'

def map(collection)
  collection.each_with_object([]) do |elem, result|
    result << yield(elem)
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

p map({'a' => 'A', 'b' => 'B'}) { |key, value| [key, value] } == [["a", "A"], ["b", "B"]]

p map(Set[1, 3, 5, 6]) { |value| value * 2 } == [2, 6, 10, 12]

