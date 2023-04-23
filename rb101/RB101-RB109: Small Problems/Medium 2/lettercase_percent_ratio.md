### Lettercase Percentage Ratio

-----------

**Problem:**

In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.  

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.  

You may assume that the string will always contain at least one character.  

--------

**Examples/Test Cases:**

```ruby
letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
```

--------

**Data Structure:**

**_Input_**

* a string.

**_Output_**

* a hash with 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

**_Rules_**

* Assume that the string will always contain at least one character.

-------

**Algorithm:**

* Initialize the method definition: `def letter_percentages(string)`
* Define a new hash object:` letter_percents = { lowercase: 0, uppercase: 0, neither: 40 }`
* Split the string into individual characters and store in an array: `chars = string.chars`
* Get the size of the `chars` array: `total_chars = chars.size`
* Create count variables for each of the 3 cases we are concerned about: `count_lower = 0`, `count_upper = 0`, and `count_neither = 0`.
* Iterate over the `chars` array using an `if/elsif/else` conditional to determine which count variables need to be incremented by 1. For example, `if char == char.upcase`, then `count_upper += 1`
* Then convert each count variable to a float and divide by the `total_chars` variable, and use them as the values for the corresponding keys of the `letter_percents` hash.

--------

**Code:**

```ruby
def letter_percentages(string)
  case_prcnt = { lowercase: 0, uppercase: 0, neither: 0 }
  percentage_factor = (100 / string.length.to_f)

  string.each_char do |char|
    if /[^a-z]/i.match?(char)
      case_prcnt[:neither] += percentage_factor
    elsif char == char.downcase
      case_prcnt[:lowercase] += percentage_factor
    else
      case_prcnt[:uppercase] += percentage_factor
    end
  end

  case_prcnt.each do |type, percent|
    case_prcnt[type] = percent.round if percent % 1 == 0
  end

  case_prcnt
end
```

----------

**Launch School Solution:**

```ruby
def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/}

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end
```

------------

**Further Exploration:**

If we passed a string `'abcdefGHI'` as an argument to our method call the solution would be `{:lowercase=>66.666666666666, :uppercase=>33.333333333333, :neither=>0.0}`. It would be nicer if we could round these float numbers so that our solution looks like this `{:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}`. Try creating that solution on your own.

```ruby
def letter_percentages(string)
  case_pct = { lowercase: 0, uppercase: 0, neither: 0 }
  percentage_factor = (100 / string.length.to_f)

  string.each_char do |char|
    if /[^a-z]/i.match?(char)
      case_pct[:neither] += percentage_factor
    elsif char == char.downcase
      case_pct[:lowercase] += percentage_factor
    else
      case_pct[:uppercase] += percentage_factor
    end
  end

  case_pct.each do |type, percent|
    if percent % 1 == 0
      case_pct[type] = percent.round
    else
      case_pct[type] = percent.round(2)
    end
  end

  case_pct
end
```

