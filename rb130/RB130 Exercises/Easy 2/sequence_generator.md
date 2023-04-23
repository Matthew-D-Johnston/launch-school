##### RB130 - Ruby Foundations: More Topics > Easy 2

---

## From-To-Step Sequence Generator

**Problem:**  

The `Range#step` method lets you iterate over a range of values where each value in the iteration is the previous value plus a "step" value. It returns the original range.  

Write a method that does the same thing as `Range#step`, but does not operate on a range. Instead, your method should take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your method should also take a block to which it will yield (or call) successive iteration values.  

---

**Examples / Test Cases:**  

```ruby
step(1, 10, 3) { |value| puts "value = #{value}" }
```

```
value = 1
value = 4
value = 7
value = 10
```

---

**Data Structure:**  

**_Inputs_**

* Three arguments will be passed to the method, all of which are Integer objects.
* The first argument represents the start of the range.
* The second argument represents the end of the range.
* The third argument represents the magnitude of the "step".
* The method will also take a block argument.

**_Outputs_**

* Method will perform the function specified by the block.
* Could return a range to make our method mimic that of the `Range#step` method.

---

**Algorithm:**

* Divide the ending range value by the step value to find the number of iterations that will be performed.
* Then use the `times` method to perform that many iterations.

---

**Code:**  

```ruby
def step(range_start, range_end, step_value)
  iterations = (range_end / step_value) + 1
  value = range_start
  
  iterations.times do 
    yield(value) unless value > range_end
    value += step_value
  end
  
  (range_start..range_end)
end
```

