# iterators_true_for_none.rb

def none?(array)
  array.each { |item| return false if yield(item) }
  true
end

puts none?([1, 3, 5, 6]) { |value| value.even? } == false
puts none?([1, 3, 5, 7]) { |value| value.even? } == true
puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none?([1, 3, 5, 7]) { |value| true } == false
puts none?([1, 3, 5, 7]) { |value| false } == true
puts none?([]) { |value| true } == true

puts "-------"


# One of Launch School's Solutions:

def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end

def none?(collection, &block)
  !any?(collection, &block)
end

puts none?([1, 3, 5, 6]) { |value| value.even? } == false
puts none?([1, 3, 5, 7]) { |value| value.even? } == true
puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none?([1, 3, 5, 7]) { |value| true } == false
puts none?([1, 3, 5, 7]) { |value| false } == true
puts none?([]) { |value| true } == true