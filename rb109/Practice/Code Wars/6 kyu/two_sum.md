### Two Sum

---

**Problem:**

Write a function that takes an array of numbers (integers for the tests) and a target number. It should find two different items in the array that, when added together, give the target value. The indices of these items should then be returned in a tuple like so: `(index1, index2)`.



For the purpose of this kata, some tests may have multiple answers; any valid solutions will be accepted.



The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers; target will always be the sum of two different items from that array).

---

**Examples / Test Cases:**

```ruby
two_sum([1, 2, 3], 4) == [0, 2]
two_sum([1234, 5678, 9012], 14690) == [1, 2]
two_sum([2, 2, 3], 4) == [0, 1]
```

---

**Data Structure:**

_**Inputs**_

* two arguments: 1) an array of integers; and 2) an integer.
* array of integers will be summed in pairs.
* the integer is the target number that the sums must be checked against in order to arrive at the output.

_**Outputs**_

* an array of integers
* the integers represent the indices of the elements whose values, when summed together, equal the target number

_**Rules**_

* input will always be valid (i.e. array will always be of length 2 or greater);
* all items of the array will be numbers;
* target will always be the sum of two different items from that array.

---

**Algorithm:**

_Main Issues_

* need to start at the first element of the array and successively add every other element to it;
* when adding, need to check the sum against the target number;
* if the sum is equal to the target number, need to extract the indices of the two numbers being added
* I think I'm going to want to use the `each_with_index` method twice on the given array.

---

**Code:**

```ruby
def two_sum(numbers, target)
  indices = []
  
  numbers.each_with_index do |outer_item, outer_idx|
    numbers.each_with_index do |inner_item, inner_idx|
      unless outer_idx == inner_idx
        indices << outer_idx << inner_idx if (outer_item + inner_item) == target
      end
    end
  end
  
  indices[0, 2]
end
```

It worked!!!

