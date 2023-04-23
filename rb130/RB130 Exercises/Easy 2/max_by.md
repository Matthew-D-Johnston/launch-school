##### RB130 - Ruby Foundations: More Topics > Easy 2

---

## max_by

**Problem:**  

The `Enumerable#max_by` method iterates over the members of a collection, passing each element to the associated block. It then returns the element for which the block returned the largest value.  

Write a method called `max_by` that behaves similarly for `Array`s. It should take an `Array` and a block, and return the element that contains the largest value.  

If the `Array` is empty, `max_by` should return `nil`.  

Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#inject`, `loop`, `for`, `while`, or `until` to iteratre through the `Array` passed in as an argument, but must not use any other methods that iterate through an `Array` or any other collection.  

```ruby
max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
max_by([]) { |value| value + 5 } == nil
```

---

**Data Structure:**  

**_Inputs_**

* Takes an Array object.
* Takes a block.

**_Outputs_**

* Outputs the element of the original Array object which is the largest out of all the elements.

**_Rules_**

* Permissible methods:
  * `#each`
  * `#each_with_object`
  * `#each_with_index`
  * `#inject`
  * `loop`
  * `for`
  * `while`
  * `until`
* All other methods that iterate through an Array or any other collection are not permissible.

---

**Algorithm:**

* Begin by initializing the method definition: `def max_by(array)`
* Initialize a local variable called `max_index` and assign it to the value `nil`
* Iterate over the elements of the array using the `each_with_index` method: `array.each do |elem, index|`
* Within the block of the `each_with_index` method, implement an `if/else` statement to check if we are on the first element of the Array object: `if index == 0` and `else`
*  For the `if` part of the conditional statement we will initialize a local variable called `current_value` and assign it to the return value from yielding to the block: `current_value = yield(elem)` 
* Reassign the `max_index` value to the current index of the current element: `max_index = index`
* For the `else` part of the statement we want to compare the `current_value` with the value of yielding to the block and reassign the `max_index` variable to the current index if the returned value of the block is greater than the `current_value`: `max_index = index if yield(elem) > current_value`
* But we also want to reassign the `current_value` to the return value of yielding to the block if the same condition holds.

---

**Code:**

```ruby
def max_by(array)
  return nil if array.empty?

  max_index = nil
  current_value = nil

  array.each_with_index do |elem, index|
    if index == 0
      current_value = yield(elem)
      max_index = index
    elsif yield(elem) > current_value
      current_value = yield(elem)
      max_index = index
    end
  end
  
  array[max_index]
end
```

