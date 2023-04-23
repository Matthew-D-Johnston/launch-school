# grocery_list.rb

# write a method
# input: array containing nested arrays with two elements: 1) fruit and
# 2) quantity of the fruit
# output: an array of the correct number of the fruits

def buy_fruit(grocery_list)
  grocery_list.map { |item| [item[0]] * item[1] }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]