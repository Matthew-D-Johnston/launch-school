##### RB130 - Ruby Foundations: More Topics > Easy 1

---

## Divisors

**Problem:**  

Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.  

---

**Examples / Test Cases:**  

```ruby
divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
```

---

**Data Structure:**  

**_Inputs_**

* A single Integer object.

**_Outputs_**

* An Array object whose elements contain Integer objects representing the divisors of the Integer object passed in as an argument to the method.

**_Rules_**

* The elements of the returned Array object can be in any sequence.

---

**Algorithm:**  

* Essentially, I'll have to iterate through every integer from `1` up to the given integer and check to see if is a divisor. The `upto` method will work for this.
* We can check if a number is a divisor using the modulo operator, `%`: if the return value is `0` then the number is a divisor; otherwise, it is not.
* We need to store each divisor in an Array object. We can assign this Array object to a variable called `divisors_array`.

---

**Code:**   

```ruby
def divisors(integer)
  divisors_array = []
  1.upto(integer) do |int|
    divisors_array << int if integer % int == 0
  end
  divisors_array
end
```

---

**Launch School's Solution:**  

```ruby
def divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end
```

---

**Further Exploration:**  

You may have noticed that the final example took a few seconds, maybe even a minute or more, to complete. This shouldn't be a surprise as we aren't doing anything to optimize the algorithm. It's what is commonly called a brute force algorithm where you try every possible solution; these are easy to write, but they don't always produce fast results. They aren't necessarily bad solutions -- it depends on your needs -- but the speed of brute force algorithms should always be examined.  

How fast can you make your solution go? How big of a number can you quickly reduce to its divisors? Can you make `divisors(999962000357)` return almost instantly? (The divisors are [1, 999979, 999983, 999962000357].) Hing: half of the divisors gives you the other half.  

**My Solution:**  

```ruby
def divisors(integer)
  starting_divisors = [1]
  ending_divisors = []
  
  2.upto(integer) do |int|
    starting_divisors << int if integer % int == 0
    break if starting_divisors.last * int > integer
  end

  starting_divisors.each do |divisor|
    ending_divisors << integer / divisor
  end
  
  starting_divisors.concat(ending_divisors).uniq.sort
end
```

