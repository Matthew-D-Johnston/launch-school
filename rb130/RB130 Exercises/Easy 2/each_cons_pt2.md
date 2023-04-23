##### RB130 - Ruby Foundations: More Topics > Easy 2

---

## each_cons (Part 2)

**Previous:**  

In the previous exercise, we wrote a method that emulates `Enumerable#each_cons`, but limited our method to handling 2 elements at a time. `Enumerable#each_cons` can actually handle any number of elements at a time: 1, 2, 3, or more.  

Update your `each_cons` method so it takes an argument that specifies how many elements should be processed at a time.  

Your method may use `#each`, `#each_index`, `#each_with_object`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.  

---

**Examples / Test Cases:**  

```ruby
hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
hash == {}
```

---

**Data Structure:**  

**_Inputs_**

* Argument 1: an Array object.
* Argument 2: an Integer object representing how many consecutive elements to pass to the block argument at a time.
* Block argument.

**_Outputs_**

* Returns `nil`
* The block operates on the elements of the Array.

**_Rules_**

* Permissible methods:
  * `#each`
  * `#each_index`
  * `#each_with_object`
  * `#inject`
  * `loop`
  * `for`
  * `while`
  * `until`
* All other methods that iterate through an Array or any other collection are not permitted.

---

**Algorithm:**  

* Begin by initializing the method definition: `def each_cons(array, n_elements)`
* initialize two range variables, `range_start = 1` and `range_end = n_elements - 1`
* 



---

**Code:**

```ruby
def each_cons(array, n_elements)
  range_start = 1
  range_end = n_elements - 1
  
  array.each do |elem|
    break if range_end >= array.size
    yield(elem, *array[range_start..range_end])
    range_start += 1
    range_end += 1
  end
  
  nil
end
```



