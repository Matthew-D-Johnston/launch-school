### Valid Series?

---

The `valid_series?` method checks whether a seris of numbers is valid. For the purposes of this exercise, a valid series of numbers must contain exactly three odd numbers. Additionally, the numbers in the series must sum to 47.



Unfortunately, our last test case is not returning the expected result. Why is that?

```ruby
def valid_series?(nums)
  return false if nums.sum != 47
  
  odd_count = nums.count { |n| n.odd? }
  odd_count = 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8]) 			# should return true
p valid_series?([1, 12, 2, 5, 16, 6]) 					# should return false
p valid_series?([28, 3, 4, 7, 9, 14]) 					# should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3]) 			# should return true
p valid_series?([10, 6, 19, 2, 6, 4]) 					# should return false
```

---

**The Problem:**

The last line, `p valid_series?([10, 6, 19, 2, 6, 4])` returns `true` instead of the expected `false`

---

**Line-by-Line Code Breakdown:**

* Line 1 – 6: we have a method method definition that includes a parameter and a block:
  - On line 1, we have the intialization of the `valid_series?` method, which takes an array object as an argument and is assigned to the parameter `nums`;
  - On line 2, we have a conditional call to `return false` if the result of the `sum` method call on the inner scope variable `nums` does not equal `47`;
  - On line 4, we have a new variable assignment and a `count` method call which is followed by a block:
    - `count` is called on `nums`, which passes each element of the `nums` array object through the block and successively assigns each element to the block's local variable `n`; the `odd?` method call is then called on `n`, which returns either `true` or `false` depending on whether `n` is odd or not; `count` will tally the number of times `true` is returned by the `odd?` method call;` 
    - The return value--an Integer object--of the `count` method call on `nums` will be assigned to the `odd_count` variable.
  -  On line 5, we have an instance of the ternary operator, where the `odd_count` variable is being compared with the integer value of `3`; however, there is a problem with code in that `=` is used rather than the proper `==` comparison operator; the effect of this mistake will ensure that the intended comparison will always evaluate to `true` and thus, the true expression of the ternary operator will always be returned, which in this case is the boolean `true`; since line 5 is the last line of the method's block, the return value of this line will be what is returned by the method, unless the `return false` on line 2 safisfies the condition expressed following the `if` statement; if `false` is not returned on line 2 then the mistake on line 5 will ensure that `true` is always returned by the method;
  - On line 6, we have the `end` expression which closes the method definition.

---

**Modified Code:**

```ruby
def valid_series?(nums)
  return false if nums.sum != 47
  
  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end
```

---

**Launch School Solution:**

```ruby
def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end
```

---

**Further Exploration:**

If you take a close look at `odd_count == 3 ? true : false`, you see that the equality comparison `odd_count == 3` itself returns a Boolean. Is the ternary operator on line 5 really necessary in order to return a Boolean from our method?



_My Response:_ No, the ternary operator is not necessary in order to get the Boolean return value that we want. Hence,

```ruby
def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3
end
```

will also work, and better.









