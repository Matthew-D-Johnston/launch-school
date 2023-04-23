Lesson 4: Ruby Collections
==========================
## Selection and Transformation

**Introduction**

Selection: picking certain elements out of the collection depending on some criterioun. For example, pick out all the odd integers from an array.

Transformation: manipulate every element in the collection. For example, increment all elements of the array by 1.

Selection and transformation both utilize the basics of looping: **a loop, a counter, a way to retrieve the current value, and a way to exit the loop.**


**Looping to Select and Transform**

Selection example:
```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0                         # 1) the counter

loop do                             # 2) the loop
  current_char = alphabet[counter]  # 3) the way to retrieve the current value

  if current_char == 'g'        # the 'selection criteria'
    selected_chars << current_char    # appends current_char into the selected_chars string
  end

  counter += 1
  break if counter == alphabet.size # 4) the way to exit the loop
end

selected_chars # => "g"
```
Transformation example:
```ruby
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0                           # 1) the counter

loop do                               # 2) the loop
  current_element = fruits[counter]   # 3) the way to retrieve the current value

  transformed_elements << current_element + 's'   # appends transformed string into array (this is the 'transformation criteria')

  counter += 1
  break if counter == fruits.size     # 4) the way to exit the loop
end

transformed_elements # => ["apples", "bananas", "pears"]
```
When performing a transformation, it's always important to pay attention to whether the original collection was mutated or if a new collection was returned.

**Extracting to Methods**

Example with hash. In this example we want to select the key-value pairs where the value is `'Fruit'`.
```ruby
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
```
How would you implement a method like this?  

My solution:
```ruby
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
```
Launch School Solution:

Hints:  
1. Remember that you have to loop through the keys in order to access the values
2. Notice that the return value of the method is a hash
```ruby
def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end
```
Notice that:  
* the original argument, `produce_list`, is not mutated
* a new hash is returned by the method (as opposed to an array or string)

Now for a transformation example extracted to a method. The code below multiplies each element in the collection by `2`.
```ruby
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end
```
This `double_numbers` method does not mutate the original array given to it as an argument. However, it is possible to create a method that does modify it. 

Try coding a `double_numbers!` method that does mutate its argument.

My Solution:
```ruby
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

  numbers.replace(doubled_numbers) # used the `replace` method to substitute the `numbers` elements with the new `doubled_numbers` ones.
end
```
Launch School solution:
```ruby
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
```
Further, transformations do not necessarily always have to be done to every element of the collection; they can also be performed on a subset of that collection.

In the following example, we only multiply by `2` if the value is odd. The `if` condition will only evaluate to `true` if `current_number` is odd (we check this using `Integer#odd?`).
```ruby
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end
```
Exercise: what if we wanted to transform the numbers based on their position in the array rather than their value?

Try coding a solution that doubles the numbers that have odd indices:

My Solution:
```ruby
def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd? # <= only change made here
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end
```
**More Flexible Methods**

By defining our methods in such a way that we can pass in additional arguments to alter the logic of the iteration, we can create more flexible and generic methods.

Taking this idea, let's update our `double_numbers` method to not only be able to double the values in an array, but to multiply by any number. For example, let's create a method called `multiply` that can take an additional argument to determine the `transformation criteria`.

Try coding a method that allows you to multiply every array item by a specified value.

My Solution:
```ruby
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
```

