# selection_and_transformation.rb
# From Selection and Transformation assignment of "Lesson 4: Ruby Collections"
# Section: Extracting to Methods
# Let's now take a look at an example with hashes. In this example we want to
# select the key-value pairs where the value is `Fruit`.

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# method: select_fruit(produce) => {"apple"=>"Fruit", "pear"=>"Fruit"}

# Pseudo-code:
# Data Structure:
# input: hash 
# output: hash with specific selected elements from original hash
# rules: ??

# Algorithm:
# By by intializing the start of the `select_fruit` method.
# We will use a loop to cycle through the given hash. Thus, there will be four
# important elements that we will need:
# 1) a counter: set `counter` = 0
# 2) a loop: `loop do` / `end`
# 3) a way to retrieve the current value: `current_value` = `produce.values
# 4) a way to exit the loop: `break` if ...???????
# within that structure, we will also need to define our selection criteria.
# selection criteria: if `current_value` == "Fruit",
#                     then `fruit` << `current_value`
# following the loop we will need to return the hash with only the selected
# elements.

def select_fruit(produce_hash)
  produce_array = produce_hash.to_a
  fruit = {}
  counter = 0 # 1) counter

  loop do   # 2) loop
    current_value = produce_array[counter] # 3) retrieve current value => ["key", "value"]
    
    if current_value.include?("Fruit")  # selection criteria
      fruit[current_value[0]] = current_value[1]
    end

    counter += 1
    break if counter == produce_array.size # 4) exit the loop
  end
  fruit
end

puts select_fruit(produce)

puts '-----'

# Transformation Extracted to Method example:
# Try writing a `double_numbers!` method that takes an array of numbers,
# multiplies each element by two, and mutates the original array.

my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  numbers.replace(doubled_numbers)
end

puts my_numbers
puts '------'
double_numbers!(my_numbers)
puts double_numbers!(my_numbers)
puts '------'
puts my_numbers

puts '------'

# Launch School Solution:

my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end

puts my_numbers
puts '------'
double_numbers!(my_numbers)
puts double_numbers!(my_numbers)
puts '------'
puts my_numbers

puts '------'


# Transformations of a subset of a collection:
# Try coding a solution that doubles the numbers of the odd indices of an
# array.

my_numbers = [1, 4, 3, 7, 2, 6]

def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd? 
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

puts my_numbers
puts '----'
puts double_odd_indices(my_numbers)
puts '----'

# Now, modify the `double_numbers` method so that it takes an additional
# argument that specifies a value to multiply the elements of the given array.
# Instead of just doubling, our method can now multiply by any number specified.

my_numbers = [1, 4, 3, 7, 2, 6]

def multiply(my_numbers, multiple)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == my_numbers.size

    current_number = my_numbers[counter]
    multiplied_numbers << current_number * multiple

    counter += 1
  end

  multiplied_numbers
end

puts my_numbers
puts '-----'
puts multiply(my_numbers, 3)

