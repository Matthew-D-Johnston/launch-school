# name_swapping.rb

# write a method
# input: single string (first name, a space, and a last name)
# output: a string containing the last name, a comma, a space, and the first
# name

def swap_name(name)
  name_arr = name.split
  "#{name_arr[1]}, #{name_arr[0]}"
end

puts swap_name('Joe Roberts')
