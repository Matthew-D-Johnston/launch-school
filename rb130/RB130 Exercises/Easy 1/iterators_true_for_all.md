##### RB130 - Ruby Foundations: More Topics > Easy 1

---

## Iterators: True for All?

**Problem:**  

`Enumerable#all?` processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a value of `true` for every element, then `#all?` returns true. Otherwise, `#all?` returns false. Note in particular that `#all?` will stop searching the collection the first time the block returns `false`.  

Write a method call `all?` that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return `true` if the block returns `true` for all of the element values. Otherwise, it should return `false`.  

Your method should stop processing elements of the Array as soon as the block returns `false`.  

If the Array is empty, `all?` should return true, regardless of how the block is defined.  

Your method may not use any standard Ruby method that is named `all?`, `any?`, `none?`, or `one?`.  

---

**Examples / Test Cases:**  

```ruby
all?([1, 3, 5, 6]) { |value| value.odd? } == false
all?([1, 3, 5, 7]) { |value| value.odd? } == true
all?([2, 4, 6, 8]) { |value| value.even? } == true
all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
all?([1, 3, 5, 7]) { |value| true } == true
all?([1, 3, 5, 7]) { |value| false } == false
all?([]) { |value| false } == true
```

---

**Data Structure:**  

**_Inputs_**

* The method will take an Array object as an argument.
* The elements of the array can be any type of object.
* The method will also take a block argument.

**_Outputs_**

* A boolean value: returns `true` if the block returns `true` for each and every element of the array that is passed to it as an argument; otherwise, the method will return `false`.

**_Rules_**

* If an empty array is passed to the method, the method should return `true`.

---

**Algorithm:**  

* This is essentially the opposite of the `any?` method: we should return `false`, instead of `true`, for any element passed to the block that returns `false`; otherwise, the method returns `true`.



---

**Code:**  

```ruby
def all?(array)
  array.each { |item| return false if !yield(item) }
  true
end
```

---

**Launch School's Solution:**  

```ruby
def all?(collection)
  collection.each { |item| return false unless yield(item) }
  true
end
```



