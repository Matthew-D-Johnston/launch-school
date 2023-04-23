##### RB130 - Ruby Foundations: More Topics > Easy 1

---

## Find Missing Numbers

**Problem:**  

Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.  

---

**Examples / Test Cases:**  

```ruby
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []
```

---

**Data Structure:**  

**_Inputs_**

* An Array object whose elements are Integer objects sorted from lowest to highest.

**_Outputs_**

* An Array object whose elements contain Integer objects that were missing in the interval between the lowest Integer object and highest Integer object given in the original Array object.
* The output is also sorted from lowest to highest.
* An empty Array object is retruned if there are no missing integers or only a single integer is provided within the array.

---

**Algorithm:**  

* Begin by initializing the method definition with a single parameter: `def missing(sorted_arr)`
* We can create a new array with the given integers and all of the missing integers by using the first and last elements of the `sorted_arr` and then calling the `to_a` method on the range of those two elements: `missing = (sorted_arr.first..sorted_arr.last).to_a`
* Then I would need some way of subtracting the elements of the original `sorted_arr` from the new array. Perhaps, I could iterate over the `sorted_arr` and call the `delete` method on the new array for each element of the `sorted_arr`: `sorted_arr.each { |int| missing.delete(int) }`

---

**Code:**

```ruby
def missing(sorted_arr)
  missing = (sorted_arr.first..sorted_arr.last).to_a
  sorted_arr.each { |int| missing.delete(int) }
  missing
end
```

---

**Launch School's Solution:**  

```ruby
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end
```

---

**Futher Exploration:**  

Can you find other ways to solve this problem? What methods might prove useful? Can you find a way to solve this without using a method that requires a block?  

**My Solution:**  

```ruby
def missing(sorted_arr)
  missing = (sorted_arr.first..sorted_arr.last).to_a
  missing - sorted_arr
end
```

