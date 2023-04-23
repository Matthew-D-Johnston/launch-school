### String Counting

---

**Problem:**

Given a string `s` of uppercase letters, your task is to determine how many strings `t` (also uppercase) with length equal to that of `s` satisfy the following conditions:

* `t` is lexicographical larger than `s`, and
* when you write both `s` and `t` in reverse order, `t` is still lexicographical larger than `s`.

String lengths are less than `5000`. Return you answer `modulo 10^9+7 (= 1000000007)`.

---

**Examples / Test Cases**

```ruby
solve('XYZ') = 5 	# => YYZ, ZYZ, XZZ, YZZ, ZZZ
```

---

**Data Structure:**

_**Inputs**_

* string

_**Outputs**_

* integer representing all of the strings that can be made with the letters of the input and which are lexicographically larger than the input

_**Rules**_

* output must be the same length as the input
* 

---

**Algorithm:**

* Take the string and split it into an array.
* Take first element of string and check against all other elements for those that are equal to or greater than the first element. Store these elements in a separate array: `first_elements = original_array.select { |char| char >= original_array[0] }`
* Here's the logic: let's take a string like `'CABTS'`
* The first character of any possible string must be equal to `'C'` or greater than `'C'`, which means `'C'`, `'T'`, or `'S'`.
* That means that any string that starts with `'T'` or `'S'` will necessarily be lexicographically greater than `'CABTS'`, that means we just need the total combinations of possible strings that can be made with all elements of strings starting with `'T'` and all those starting with `'S'`.
* Taking those two we have, `2*5*5*5*5`
* This can be generalized to something where the total number of elements is raised to the power of the length of the string - 1, and then multiplied by the total number of characters that are greater than the first character.
* Now it's like `'C'` doesn't matter any more.
* For the second slot, we have `'A'` as our element, which means there are four other possible elements that are greater and we have, `4*5*5*5`; again we can generalize this;
* For the third slot we have `3*5*5`

---

**Code:**

```ruby
def string_counter(string)
  alphabet = ('A'..'Z').to_a
  alphabet_strings = alphabet
  possible_strings = []

  (string.length - 1).times do
    possible_strings = []
    alphabet_strings.each do |chars|
      alphabet.each do |letter|
        possible_strings << chars + letter
      end
    end
    
    alphabet_strings = possible_strings
  end

  possible_strings.count do |str|
    str > string && str.reverse > string.reverse
  end
end
```

This code passed the sample tests but is not optimal as it timed out in the final attempt. Indeed, for string lengths beyond six characters it becomes really inefficient.



Here's the new code:

```ruby
ALPHA_HASH = {"A"=>1, "B"=>2, "C"=>3, "D"=>4, "E"=>5, "F"=>6,
              "G"=>7, "H"=>8, "I"=>9, "J"=>10, "K"=>11,
              "L"=>12, "M"=>13, "N"=>14, "O"=>15, "P"=>16,
              "Q"=>17, "R"=>18, "S"=>19, "T"=>20, "U"=>21,
              "V"=>22, "W"=>23, "X"=>24, "Y"=>25, "Z"=>26
            }

NUMBER_OF_LETTERS = 26

def multiply_ends_and_everything_in_between(array)
  beginning_factor = NUMBER_OF_LETTERS - ALPHA_HASH[array.first]
  ending_factor = NUMBER_OF_LETTERS - ALPHA_HASH[array.last]
  everything_in_between = NUMBER_OF_LETTERS**(array.size - 2)

  beginning_factor * ending_factor * everything_in_between
end

def add_value_of_each_char(array)
  new_array =[]
  array.each do |char|
    new_array << NUMBER_OF_LETTERS - ALPHA_HASH[char]
  end
  new_array.sum
end

def successive_multiplication(array)
  total = 0 
  1.upto(array.length - 3) do |idx|
    total += (26 - ALPHA_HASH[array[idx]]) * (26 - ALPHA_HASH[array[-1]]) * 26**(array[idx..-1].length - 2)
  end
  total += (26 - ALPHA_HASH[array[-2]]) * (26 - ALPHA_HASH[array[-1]])
end


def string_counter(string)
  string_chars = string.chars
  total_combinations = 0

  loop do
    if string_chars.size == 1
      total_combinations += NUMBER_OF_LETTERS - ALPHA_HASH[string_chars.first]
      break
    elsif string_chars.size == 2
      first_factor = NUMBER_OF_LETTERS - ALPHA_HASH[string_chars.first]
      second_factor = NUMBER_OF_LETTERS - ALPHA_HASH[string_chars.last]
      total_combinations += first_factor * second_factor
      break
    else
      total_combinations += multiply_ends_and_everything_in_between(string_chars)
      total_combinations += add_value_of_each_char(string_chars)
      total_combinations += successive_multiplication(string_chars)
      total_combinations += successive_multiplication(string_chars.reverse)
    end

    string_chars.shift
    string_chars.pop
    break if string_chars.size == 1
  end

  total_combinations
end
```

Much more efficient, but still not efficient enough for Code Wars. Also, this code ended up not being correct, at least not past strings with more than four characters.



Here is the code that appears to be working, and it's considerably faster than my first one.

```ruby
LETTERS = {"A" => 26, "B" => 25, "C" => 24, "D" => 23, "E" => 22, "F" => 21,
              "G" => 20, "H" => 19, "I" => 18, "J" => 17, "K" => 16,
              "L" => 15, "M" => 14, "N" => 13, "O" => 12, "P" => 11,
              "Q" => 10, "R" => 9, "S" => 8, "T" => 7, "U" => 6,
              "V" => 5, "W" => 4, "X" => 3, "Y" => 2, "Z" => 1
            }

TOTAL_LETTERS = 26


# letter_value_array = string.chars.map { |char| LETTERS[char] }

def letter_value_conversion(array)
  new_array = []
  last_idx = array.size - 1

  array.each_with_index do |value, idx|
    if idx == 0 || idx == last_idx
      new_array << value - 1
    else
      new_array << TOTAL_LETTERS
    end
  end

  new_array
end

def string_counter(string)
  letter_values = string.chars.map { |char| LETTERS[char] }
  total_combinations = 0
  last_idx = letter_values.size - 1


  loop do 
    0.upto(last_idx) do |idx|
      array_range = letter_values[idx..last_idx]
      total_combinations += letter_value_conversion(array_range).reduce(:*)
    end

    1.upto(last_idx) do |idx|
      array_range = letter_values.reverse[idx..last_idx]
      total_combinations += letter_value_conversion(array_range).reduce(:*)
    end

    break if letter_values.size <= 2
    letter_values.shift
    letter_values.pop
    last_idx = letter_values.size - 1
  end


  total_combinations % ((10**9)+7)
end
```



