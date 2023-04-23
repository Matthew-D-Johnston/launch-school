# iterators_true_for_any.rb

def any?(array)
  return false if array.empty?
  block_value = nil
  
  if block_given?
    array.each do |elem|
      block_value = yield(elem)
      break if block_value == true
    end
  else
    block_value = true
  end
  
  block_value
end

puts any?([1, 3, 5, 6]) { |value| value.even? } == true
puts any?([1, 3, 5, 7]) { |value| value.even? } == false
puts any?([2, 4, 6, 8]) { |value| value.odd? } == false
puts any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
puts any?([1, 3, 5, 7]) { |value| true } == true
puts any?([1, 3, 5, 7]) { |value| false } == false
puts any?([]) { |value| true } == false
puts any?([1, 2, 3]) == true

puts "--------"

puts any?({ 'a' => 1, 'b' => 2 }) { |value| value.odd? }

puts "--------"

# Launch School's Solution:

def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end

puts any?([1, 3, 5, 6]) { |value| value.even? } == true
puts any?([1, 3, 5, 7]) { |value| value.even? } == false
puts any?([2, 4, 6, 8]) { |value| value.odd? } == false
puts any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
puts any?([1, 3, 5, 7]) { |value| true } == true
puts any?([1, 3, 5, 7]) { |value| false } == false
puts any?([]) { |value| true } == false