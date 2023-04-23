##### RB130 - Ruby Foundations: More Topics > Easy 2

---

## map

**Problem:**  

The `Enumerable#map` method iterates over the members of a collection, using the associated block to perform some sort of operation on each collection member. The returned values from the block are then built up into an Array that is then returned to the caller. Note in particular that every time `#map` yields to the block, it obtains just one value. That value may be a complex value -- it may even be another collection -- but it is nevertheless just one value. Thus, `#map` returns an Array that has the same number of elements that the original collection had.  

Write a method called `map` that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return a new Array that contains the return values produced by the block for each element of the original Array.  

If the Array is empty, `map` should return an empty Array, regardless of how the block is defined.  

Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.  

---

**Examples / Test Cases:**  

```ruby
map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
map([]) { |value| true } == []
map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
```

---

**Data Structure:**  

**_Inputs_**

* The method will take an Array object as an argument and will also take a block as an argument.

**_Ouputs_**

* The method will return an Array object whose size is the same as the original Array object and whose elements are the return values of the execution of the block on the elements of the original array.

**_Rules_**

* The following methods may be used:
  * `#each`
  * `#each_with_object`
  * `#each_with_index`
  * `#inject`
  * `loop`
  * `for`
  * `while`
  * `until`
* Any other method that iterates through an Array or any other collection may not be used.

---

**Algorithm:**  

* Start by initializing the method definition with a parameter: `def map(collection)`
* We could use `each_with_object` to iterate over the original Array object and shoving the return value of yielding to the block for each element to the object.

---

**Code:**

```ruby
def map(collection)
  collection.each_with_object do |elem, result|
    result << yield(elem)
  end
end
```

