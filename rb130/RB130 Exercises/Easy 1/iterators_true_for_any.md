##### RB130 - Ruby Foundations: More Topics > Easy 1

---

## Iterators: True for Any?

**Problem:**  

The `Enumerable#any?` method processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a value of `true` for any element, then `#any?` returns true. Otherwise, `#any?` returns false. Note in particular that `#any?` will stop searching the collection the first time the block returns `true`.  

Write a method called `any?` that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return `true` if the block returns `true` for any of the element values. Otherwise, it should return `false`.  

Your method should stop processing elements of the Array as soon as the block returns `true`.  

If the Array is empty, `any?` should return false, regardless of how the block is defined.  

Your method may not use any standard Ruby method that is named `all?`, `any?`, `none?`, or `one?`.  

----

**Examples / Test Cases:**  

```ruby
any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? } == false
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false
```

---

**Data Structure:**  

**_Inputs_**

* An Array object whose elements could be a variety of different objects.
* The method also takes a block argument.

**_Outputs_**

* A boolean value, either `true` or `false`.

**_Rules_**

* The method should return `false` if an empty array is passed as an argument to the method.

---

**Algorithm:**  

* We begin by initializing the method definition with a single parameter: `def any?(array)`
* We want to return `false` if the array is empty; hence: `return false if array.empty?`
* Next, we want to iterate over the elements of the array, and yielding each element to the block. We can use the `each` method: `array.each`
* Within the block of the `each` method, we will want to yield each element to the block, and then break out of the loop if any of the arguments that we yield to the block return `true`. We should store the return value of yielding to the block in a separate variable, `block_value`.

---

**Code:**

```ruby
def any?(array)
  return false if array.empty?
  block_value = nil
  
  if block_given?
    array.each do |elem|
      block_value = yield(elem)
      break if block_value == true
    end
  else
    block_value = true
  end
  
  block_value
end
```

---

**Launch School's Solution:**  

```ruby
def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end
```

