##### RB130 Ruby Foundations: More Topics > Lesson 1: Blocks

---

## Assignment: Build a 'reduce' method

**Problem:**  

In this assignment, let's implement a `reduce` method, similar to `Enumberable#reduce`. Before we do so, let's get (re-)acquainted with the `Enumerable#reduce` method. `reduce` is another name for the `inject` method, and its main goal is to "fold" or "accumulate" a collection into 1 object. What the specific folding or accumulation mechanism is depends on the code passed in to the block.

---

**Examples / Test Cases:**  

The original `reduce` method:

```ruby
[1, 2, 3].reduce do |acc, num|
  acc + num
end

# => 6

[1, 2, 3].reduce(10) do |acc, num|
  acc + num
end

# => 16
```

Our new `reduce` method:

```ruby
array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }
# => 15
reduce(array, 10) { |acc, num| acc + num }
# => 25
reduce(array) { |acc, num| acc + num if num.odd? }
# => NoMethodError: undefined method `+' for nil:NilClass
```

---

**Data Structure:**

**_Inputs_**

* The calling object of the method is an Array object. The method can take an optional argument that sets the initial starting value, and takes a block argument for the additional implementation details of the method.

**_Outputs_**

* Returns a single output object, which is a result of operating on the elements of the array.

---

**Algorithm:**  

* Need to define the method so that it takes an Array object as well as another optional argument. For starters, we'll assume that the Array object contains Integer objects as its elements. Thus, the optional argument will start with a default value of 0: `current_val = 0`
* Let's also initialize a `counter` variable with the value `0`.
* We will need to iterate over the Array object, which we can do using a `while` conditional that checks to see if the `counter` variable is less than the size of the Array object.
* Inside the loop, we want to yield to the block argument, passing in the `current_val` and the current element of the Array object. The return value of the block should be assigned to the `current_val` variable.
* Then we increment the `counter` variable by 1.
* When the `counter` variable is equal to the size of the original Array object, the loop is exited.
* We then return the `current_val` variable.

---

**Code:**  

```ruby
def reduce(array, current_value=0)
  counter = 0
  
  while counter < array.size
    current_element = array[counter]
    current_value = yield(current_value, current_element) 
    counter += 1
  end

  current_value
end
```

Version that allows for Array objects whose elements are String objects.

```ruby
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
```

Extra challenge:

```ruby
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
```



