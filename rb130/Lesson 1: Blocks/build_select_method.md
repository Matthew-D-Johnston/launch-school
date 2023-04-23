

##### RB130 Ruby Foundations: More Topics > Lesson 1: Blocks

---

## Assignment: Build a 'select' method

**Problem:**  

Write a `select` method that mirrors the behaviour of `Array#select`. Note that the `Array#select` method takes a block, then yields each element to the block. If the block evaluates to true, the current element will be included in the returned array. If the block evaluates to false, the current element will not be included in the returned array.  

---

**Examples / Test Cases:**  

```ruby
array = [1, 2, 3, 4, 5]

array.select { |num| num. odd? }
# => [1, 3, 5]
array.select { |num| puts num }
# => [], because "puts num" returns nil and evaluates to false.
array.select { |num| num + 1 }
# => [1, 2, 3, 4, 5], because "num + 1" evaluates to true.
```

Therefore, your assignment is to write a `select` method with the above behaviour, and you should be able to call it like this.

```ruby
array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }
# => [1, 3, 5]
select(array) { |num| puts num }
# => [], because "puts num" returns nil and evaluates to false.
select(array) { |num| num + 1 }
# => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
```

---

**Data Structure:**  

**_Inputs_**

* The calling object of the method will be an Array object, and the method will take a block as an argument.

**_Outputs_**

* The return value of the method will be an Array object containing the elements of the original Array object that evaluate to true by the block.

---

**Algorithm:**  

* Need a way to iterate over the elements of the Array object. Could initialize a `counter` variable to `0`, and then loop through the elements of the Array, incrementing the `counter` variable by 1 on each iteration.
* We should also initialize a local variable called `results_array`, and assign an empty Array object to it.
* Within the loop we will need to yield to the block of code, passing in the current element of the original Array object. We should store the return value of the block in a variable called `result`.
* We can then 'push' the current element of our original Array object to our `results_array` object if the `result` evaluates to true.
* We then increment our `counter` variable.
* When the `counter` variable is equal to the number of elements within the array, the loop will be exited.
* We then return the value referenced by the `results_array` Array object.

---

**Code:**  

```ruby
def select(array)
  counter = 0
  results_array = []

  while counter < array.size
    results_array << array[counter] if yield(array[counter])
    counter += 1
  end

  results_array
end

array = [1, 2, 3, 4, 5]
```

