### Next Featured Number Higher than a Given Value

---

**Problem:**

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, `49` is a featured number, but `98` is not (it is not odd), `97` is not (it is not a multiple of 7), and `133` is not (the digit 3 appears twice).



Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

---

**Examples / Test Cases:**

```ruby
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
```

---

**Data Structure:**

**_Inputs_**

* an integer

**_Outputs_**

* an integer that is 1) higher than the given value; 2) a multiple of 7; 3) is odd; and 4) does not contain any digit that appears more than once.

---

**Algorithm:**

* Initialize method definition: `def featured(given_value)`
* assign `multiple_of_seven` to `given_value + 1`
* use an "until loop" to keep adding one to `multiple_of_seven` until `multiple_of_seven % 7 == 0`
* Then, convert multiple of seven to a string and split it into individual digit characters and assign to `multiple_of_seven_arr`.
* Then use another "until loop" to keep adding 7 to `multiple_of_seven` until it is odd and contains only unique digits. Put in a `break` condition if `multiple_of_seven >= 9_999_999_999`.
* if `multiple_of_seven < 9_999_999_999` return `multiple_of_seven`; otherwise, return 'There is no possible number that fulfills those requirements'.

---

**Code:**

```ruby
def multiple_of_seven(int)
  until int % 7 == 0
    int += 1
  end
  int
end

def odd_and_unique(int)
  int_arr = int.to_s.chars
  
  until (int.odd? && int_arr.uniq == int_arr) || int >= 9_999_999_999
    int += 7
    int_arr = int.to_s.chars
  end
  
  int
end

def featured(given_value)
	featured_num = odd_and_unique(multiple_of_seven(given_value + 1))
  
  if featured_num < 9_999_999_999
    featured_num
  else
    puts "There is no possible number that fulfills those requirements."
  end
end
```

---

**Launch School Solution:**

```ruby
def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0
    
  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end
  
  'There is no possible number that fulfills those requirements.'
end
```

