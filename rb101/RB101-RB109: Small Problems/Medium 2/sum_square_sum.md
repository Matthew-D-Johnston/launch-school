### Sum Square – Square Sum

---

**Problem:**

Write a method that computes the difference between the square of the sum of the first `n` positive integers and the sum of the squares of the first `n` positive integers.

---

**Examples / Test Cases:**

```ruby
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150
```

---

**Data Structure:**

**_Inputs_**

* integer value, `n`

**_Outputs_**

* integer value that represents the difference between the square of the sum of the first `n` positive integers and the sum of the squares of the first `n` positive integers.

**_Rules_**

* Assume `n` is always a positive integer.

---

**Algorithm:**

* Create three separate methods: 1) calculates the square of the sum of the first `n` positive numbers; 2) calculates the sum of the squares of the first `n` positive numbers; and 3) is the final method that takes the difference of the return values of the other two methods.
* First method: `def square_of_sum(n)`
  - `1.upto(n).reduce(:+)**2`
* Second method: `def sum_of_squares(num)`
  - `1.upto(n).reduce { |sum, num| sum + num**2  }`
* Third method: `def sum_square_difference(n)`
  - `square_of_sum(n) - sum_of_squares(n)`

---

**Code:**

```ruby
def square_of_sum(n)
  1.upto(n).reduce(:+)**2
end

def sum_of_squares(n)
  1.upto(n).reduce { |sum, num| sum + num**2 }
end

def sum_square_difference(n)
  square_of_sum(n) - sum_of_squares(n)
end
```

---

**Launch School Solution:**

```ruby
def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0
  
  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end
  
  sum**2 - sum_of_squares
end
```

