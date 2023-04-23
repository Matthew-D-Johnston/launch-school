# build_reduce_method.rb

def reduce(array, current_value=0)
  counter = 0
  
  while counter < array.size
    current_element = array[counter]
    current_value = yield(current_value, current_element) 
    counter += 1
  end

  current_value
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num } == 15
p reduce(array, 10) { |acc, num| acc + num } == 25

puts "--------"


def reduce(array, current_value=nil)
  counter = 0

  if array.all? { |elem| elem.class == Integer } && current_value == nil
    current_value = 0
  elsif array.all? { |elem| elem.class == String } && current_value == nil
    current_value = ''
  end

  while counter < array.size
    current_element = array[counter]
    current_value = yield(current_value, current_element) 
    counter += 1
  end

  current_value
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num } == 15
p reduce(array, 10) { |acc, num| acc + num } == 25
# p reduce(array) { |acc, num| acc + num if num.odd? }
p reduce(['a', 'b', 'c']) { |acc, num| acc += num } == 'abc'

puts "-------"
# Extra Challenge:


def reduce(array, current_value=nil)
  counter = 0

  if current_value == nil
    current_value = class_default_value(array)
  end

  while counter < array.size
    current_element = array[counter]

    if current_value.class == Array
      current_value << current_element
      current_value.flatten!
    else
      current_value = yield(current_value, current_element) 
    end

    counter += 1
  end

  current_value
end

def class_default_value(array)
  default_value = nil

  if array.all? { |elem| elem.class == Integer }
    default_value = 0
  elsif array.all? { |elem| elem.class == String }
    default_value = ''
  elsif array.all? { |elem| elem.class == Array }
    default_value = []
  end

  default_value
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num } == 15
p reduce(array, 10) { |acc, num| acc + num } == 25
# p reduce(array) { |acc, num| acc + num if num.odd? }
p reduce(['a', 'b', 'c']) { |acc, num| acc += num } == 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } == [1, 2, 'a', 'b']

