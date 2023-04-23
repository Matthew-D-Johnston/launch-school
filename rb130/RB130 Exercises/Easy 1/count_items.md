##### RB130 - Ruby Foundations: More Topics > Easy 1

---

## Count Items

Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the block returns `true`.  

You may not use `Array#count` or `Enumerable#count` in your solution.  

---

**Examples / Test Cases:**  

```ruby
count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2
```

---

**Data Structure:**  

**_Inputs_**

* An Array object whose elements may be any type of object.
* The method will also accept a block as an argument.

**_Outputs_**

* An Integer object representing the number of times the block returned `true` for the elements of the array that were passed to it as arguments.

---

**Algorithm:**

* Use a `counter` variable initialized at `0` and increments by one each time yielding to the block returns `true`.

---

**Code:**  

```ruby
def count(array)
  counter = 0
  array.each { |item| counter += 1 if yield(item) }
  counter
end
```

---

**Further Exploration:**  

Write a version of the `count` method that meets the conditions of this exercise, but also does not use `each`, `loop`, `while`, or `until`.  

**My Solution:**

```ruby
def count(array)
  array.select { |item| yield(item) }.size
end
```

