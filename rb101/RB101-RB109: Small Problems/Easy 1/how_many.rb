# how_many.rb
# Write a method that counts the number of occurrences of each element in a given
# array. The words in the array are case sensitive. Once counted, print each element
# alongside the number of occurrences.

# Pseudo-code:
# Take an array with any number of elements.
# Count the number of occurrences of each unique element.
# Store each unique element along with its number of occurences in a new object,
# like a hash.
# Print each element alongside its number of occurrences.

# Formal pseudo-code:
# START by defining a mehthod that takes an array as an argument.
# SET the unique elements of the array into a new array.
# READ the new array by iterating over each element and using a method to
# evaluate whether each element in the original array is equal to each element
# in the new array. The method should return an array of boolean values. The
# boolean values for each elment will be counted and the number should be 
# assigned as the value of a symbol-key of the unique element.
# SET each of the key-value pairs created above into a hash object.
# PRINT the hash object to the screen
# END



def count_occurrences(array)
  uniq_arr = array.uniq                             # => ['car', 'truck', 'SUV', 'motorcycle']
  
  uniq_arr.each do |element|                        # 
    bool_arr = array.map { |i| i == element }        # new array of boolean values
    only_true = bool_arr.select { |i| i == true }    # new array that selects only the `true` values
    puts "#{element} => #{only_true.length}"        # prints each element with => and matches with length of arrays of only 'true' values
  end

end


vehicles = [ 
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

puts "----------"

names = ['Bobby', 'Matty', 'Matty', 'Joey', 'Bobby', 'Sally',
          'Sally', 'Sally', 'Heidi', 'Bobby', 'Bobby', 'Charlie',
          'Charlie', 'Bobby']

count_occurrences(names)

puts "-------"


# Launch School solution:

def count_occurrences(array)
  occurrences = {}                                  # creates an empty hash

  array.each do |element|
    occurrences[element] = array.count(element)     # stores each element of the array as the  
  end                                               # occurrence hash key and pairs it with the 
                                                    # number of times the element occurs in the array

occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end


count_occurrences(vehicles)

puts "------"

# Further Exploration:
# Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".

def count_occurrences(array)
  array.each { |i| i.downcase! }
  uniq_arr = array.uniq                             # => ['car', 'truck', 'SUV', 'motorcycle']
  
  uniq_arr.each do |element|                        # 
    bool_arr = array.map { |i| i == element }        # new array of boolean values
    only_true = bool_arr.select { |i| i == true }    # new array that selects only the `true` values
    puts "#{element} => #{only_true.length}"        # prints each element with => and matches with length of arrays of only 'true' values
  end

end


vehicles = [ 
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)


