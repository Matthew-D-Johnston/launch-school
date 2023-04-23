# grocery_list.rb
# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

# Pseudo-code:

# Data Structure:
# input: an array with nested arrays containing the name of a fruit and the
# quantity of that fruit required.
# output: an array containing the names of the fruits as many times specified
# by their quantity

# Algorithm:
# 1) initialize the method definition: def buy_fruit(grocery_list)
# 2) define an empty each_item array: each_item = []
# 3) iterate over the nested arrays and use the times method to add the first
#    elements of the nested arrays to the each_item array according to the
#    specified quantities.
# 4) Return the each_item array

def buy_fruit(grocery_list)
  each_item = []
  grocery_list.each do |item|
    item[1].times { each_item << item[0] }
  end
  each_item
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]

puts '------'

# Launch School solution:

def buy_fruit(list)
  expanded_list = []

  list.each do |item|
    fruit, quantity = item[0], item[1]
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]

puts '------'

# ...or...

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
