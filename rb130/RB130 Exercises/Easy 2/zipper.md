##### RB130 - Ruby Foundations: More Topics > Easy 2

---

## Zipper

**Problem:**  

The `Array#zip` method takes two arrays, and combines them into a single array in which each element is a two-element array where the first element is a value from one array, and the second element is a value from the second array, in order. For example:

```ruby
[1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
```

Write your own version of `zip` that does the same type of operation. It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed). Do not use the built-in `Array#zip` method. You may assume that both input arrays have the same number of elements.

---

**Examples / Test Cases:**  

```ruby
zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
```

---

**Data Structure:**  

**_Inputs_**

* Two arguments, both of which are Array objects.

**_Outputs_**

* The method should return an Array objects whose elements are Array objects containing corresponding elements from the original two Array object inputs.

**_Rules_**

* Assume the input Array objects are the same size

---

**Algorithm:**

* The `map` method will come in handy here.

---

**Code:**

```ruby
def zip(arr1, arr2)
	index_end = arr1.size - 1
  (0..index_end).to_a.map { |idx| [arr1[idx], arr2[idx]] }
end
```



