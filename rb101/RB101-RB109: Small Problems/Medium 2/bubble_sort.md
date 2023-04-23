### Bubble Sort

---

**Problem:**

Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.



A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.



(See [LS page for this exercise](https://launchschool.com/exercises/2a5d5a4e) for visual example.)



We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted. 



For further information, including pseudo-code that demonstrates the algorithm as well as minor optimization technique, see the [Bubble Sort wikipedia page](https://en.wikipedia.org/wiki/Bubble_sort).



Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

---

**Examples / Test Cases:**

```ruby
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
```

---

**Data Structure:**

**_Inputs_**

* an array

**_Outputs_**

* a sorted version of the original array

**_Rules_**

* the method will mutate the original array
* assume that the Array contains at least 2 elements

---

**Algorithm:**

* Initialize the method definition: `def bubble_sort!(array)`

* Will need to loop over the elements of the array and do so until the method is sorted; thus, will need a way to identify that the sorting has been completed.

* Set two counter variables: 1) a `start_counter` and 2) an `end_counter`; each will start at zero; upon each iteration, if an exchange is made, then increment `start_counter` by 1. If `start_counter == end_counter` after a full iteration through all elements then break out of the loop; I envisions something like the following:

  ```ruby
  start_counter = 0
  end_counter = 0
  
  loop do
    array.each_with_index do |elem, idx|
      # if elem exchanged
      	start_counter += 1
      # end
    end
    
    start_counter == end_counter ? break : end_counter = start_counter
  end  	
  ```

  

* Inside the `each_with_index` method:

* if `idx == 0` assign `elem` to a `current_value` variable

* else,

  - if  `current_value <==> elem == 1`
  - `array[idx-1] = elem`
  - `array[idx] = current_value`
  - `start_counter += 1`
  - else 
  - `current_value = elem`

---

**Code:**

```ruby
def bubble_sort!(array)
  counter = 0
  break_condition = counter

  loop do
    current_value = nil

    array.each_with_index do |elem, idx|
      if idx == 0 || current_value <= elem
        current_value = elem
      else
        array[idx - 1] = elem
        array[idx] = current_value
        counter += 1
      end
    end

    counter == break_condition ? break : break_condition = counter
  end
end
```

---

**Launch School Solution:**

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

---

**Further Exploration:**

Note that we did not use the optimization suggested on the Wiki page that skips looking at tail elements that we know are already sorted. If your solution also skipped this optimization, try modifying your solution so it uses that optimization.

* The key to the optimization is realizing that the _n_-th pass of the algorithm finds the _n_-th largest element and puts it into its final place.

```ruby
def bubble_sort!(array)
  counter = 0
  break_condition = counter
  idx_counter = array.size

  loop do
    previous_elem = nil

    array.each_with_index do |current_elem, idx|
      break if idx == idx_counter
      
      if idx == 0 || previous_elem <= current_elem
        previous_elem = current_elem
      else
        array[idx - 1] = current_elem
        array[idx] = previous_elem
        counter += 1
      end
    end

    idx_counter -= 1
    counter == break_condition ? break : break_condition = counter
  end
end
```



