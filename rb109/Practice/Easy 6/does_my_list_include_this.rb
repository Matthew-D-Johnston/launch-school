# does_my_list_include_this.rb

# write a method
# input: an array and a search value
# output: true if the array contains the value, otherwise false

def include?(list, search_value)
  !list.select { |element| element == search_value }.empty?
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


