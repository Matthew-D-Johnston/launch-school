##### RB130 - Ruby Foundations: More Topics > Easy 2

---

## each_with_index

**Problem:**  

The `Enumerable#each_with_index` method iterates over the members of a collection, passing each element and its index to the associated block. The value returned by the block is not used. `each_with_index` returns a reference to the original collection.  

Write a method called `each_with_index` that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should yield each element and an index number to the block. `each_with_index` should return a reference to the original Array.  

Your method may use `#each`, `#each_with_object`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.  

---

**Examples / Test Cases:**  

```ruby
result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
```

should output:

```
0 -> 1
1 -> 3
2 - 36
true
```

---

**Data Structure:**  

**_Inputs_**

* The method takes an Array object as an argument and a block.
* The method iterates over the Array object and will yield each element along with its index as arguments to the block.

**_Outputs_**

* The method will execute the code implemented by the user in the block, but will return the original Array object.

**_Rules_**

* Permissible methods:
  * `#each`
  * `#each_with_object`
  * `#inject`
  * `loop`
  * `for`
  * `while`
  * `until`
* No other methods that iterate through an Array or any other collection are permissible.

---

**Algorithm:**  

* Begin by initializing the method definition: `def each_with_index(array)`



---

**Code:**  

```ruby
def each_with_index(array)
  idx = 0
  array_copy = array.clone
  
  while idx < array.size
    yield(array_copy[idx], idx)
  end
  
  array
end
```

---

**Launch School's Solution:**  

```ruby
def each_with_index(array)
  index = 0
  array.each do |item|
    yield(item, index)
    index += 1
  end
end
```

