##### RB130 - Ruby Foundations: More Topics > Easy 2

---

## each_cons (Part 1)

The `Enumerable#each_cons` method iterates over the members of a collection taking each sequence of `n` consecutive elements at a time and passing them to the associated block for processing. It then returns a value of `nil`.  

Write a method called `each_cons` that behaves similarly for Arrays, taking the elements 2 at a time. The method should take an Array as an argument, and a block. It should yield each consecutive pair of elements to the block, and return `nil`.  

Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.  

---

**Examples / Test Cases:**  

```ruby
hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}
result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
hash == {'a' => 'b'}
result == nil
```

---

**Data Structure:**  

**_Inputs_**

* An Array object.
* A block.

**_Outputs_**

* The method returns `nil`
* The block performs the functions specified by the user, taking two consecutive elements of the Array object as its arguments.

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
* All other methods that iterate thorugh an Array or any other collection are not permissible.

---

**Algorithm:**  

* Begin by initializing the method definition: `def each_cons(array)`
* Iterate through the elements of the Array using `each_with_index`: `array.each_with_index do |elem, idx|`
* Within the block of the `each_with_index` method, use a `while` loop that will run `while idx + 1 < array.size`
* Within the block of the `while` method we shall yield to the block: `yield(elem, array[idx + 1])`
* The last line should be `nil` since that is the return value of the method.

---

**Code:**  

```ruby
def each_cons(array)
  idx = 0
  next_idx = 1

  while next_idx < array.size
    yield(array[idx], array[next_idx])
    idx += 1
    next_idx += 1
  end
  
  nil
end
```

Completely changed the implementation when I went to code as I found problems with my original algorithm.