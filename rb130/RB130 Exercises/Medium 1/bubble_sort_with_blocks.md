##### RB130 - Ruby Foundations: More Topics > Medium 1

---

## Bubble Sort with Blocks

**Problem:**  

In an [earlier exercise](https://launchschool.com/exercises/2a5d5a4e), you were asked to construct a `#bubble_sort!` method that used the bubble sort algorithm to sort Arrays in place. Our solution was this: 

```ruby
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
    
    break unless swapped
  end
  nil
end
```

The problem with this solution is that it doesn't give you any freedom in terms of the criteria used for the sort. For example, perhaps you want to sort the Array in reverse order from usual, or perhaps you want to sort a list of names in a case-insensitive manner.  

Your task in this assignment is to modify `#bubble_sort!` so it takes an optional block that determines which of two consecutive elements will appear first in the results.  

If you still have a copy of your `#bubble_sort!` method, you may use that method as the basis for this exercise. Otherwise, you can use the above solution.  

---

**Examples / Test Cases:**  

```ruby
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)
```

---

**Data Structure:**  

**_Inputs_**

* An Array object.
* A block argument.

**_Outputs_**

* An Array object sorted in ascending order unless otherwise specified by the block.

---

**Algorithm:**

* We already have the main method implementation. We just need to figure out where and how to implement the `yield` in order to use the arguments supplied in the block argument.
* Based on the examples, the block takes two arguments. Thus within our method we need to yield two arguments to the block. The most logical thing would be to yield `array[index - 1]` and `array[index]`.
* We also note that the code within the block should return a boolean value.
* It appears that rather than the line `next if array[index - 1] <= array[index]` we should have the following `next if yield(array[index - 1], array[index])`.

---

**Code:**  

```ruby
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index]
      end
      
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end
```

---

**Further Exploration:**  

Modify your solution so it only passes one element to the block at a time; the block should perform some sort of transformation to the argument, and `#bubble_sort!` itself should just use `<=` to compare two values. In other words, you should be able to call `#bubble_sort!` like this:  

```ruby
array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)
```

**My Solution:**

```ruby
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1]) <= yield(array[index])
      else
        next if array[index - 1] <= array[index]
      end

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
    
    break unless swapped
  end
  nil
end
```

