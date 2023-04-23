##### RB130 - Ruby Foundations: More Topics > Easy 2

---

## count

**Problem:**  

The `Enumerable#count` method iterates over the members of a collection, passing each element to the associated block. It then returns the number of elements for which the block returns a truthy value.  

Write a method called `count` that behaves similarly for an arbitrarily long list of arguments. It should take 0 or more arguments and a block, and then return the total number of arguments for which the block returns true.  

If the argument list is empty, `count` should return `0`.  

Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.  

---

**Examples / Test Cases:**  

```ruby
count(1, 3, 6) { |value| value.odd? } == 2
count(1, 3, 6) { |value| value.even? } == 1
count(1, 3, 6) { |value| value > 6 } == 0
count(1, 3, 6) { |value| true } == 3
count() { |value| true } == 0
count(1, 3, 6) { |value| value - 6 } == 3
```

---

**Data Structure:**  

**_Inputs_**

* The method takes 0 to any number of arguments.
* These arguments may be an object of any type.

**_Outputs_**

* A single Integer object representing the number of arguments for which the block returns a truthy value.

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
* No other method that iterates through an Array or any other collection is permissible.

---

**Algorithm:**

* Begin by initializing the method definition with the a parameter that allows for any number of arguments to be passed in: `def count(*args)`
* We should be able to use the `each_with_object` method and pass `0` as the argument, which will represent the beginning total of the arguments for which the block returns a truthy value.

---

**Code:**  

```ruby
def count(*args)
  total = 0
  args.to_a.each do |elem| 
    total += 1 if yield(elem)
  end
  total
end
```

