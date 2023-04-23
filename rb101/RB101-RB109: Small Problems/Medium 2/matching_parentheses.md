### Matching Parentheses

---

**Problem:**

Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching `'('` and `')'` pairs.

---

**Examples / Test Cases:**

```ruby
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
```

Note that balanced pairs much each start with a `(`, not a `)`.

---

**Data Structure:**  

**_Input(s)_**

* a string.

**_Output(s)_**

* a boolean value: `true` if all parentheses in the string are properly balanced, `false` otherwise.

**_Rules_**

* To be properly balanced, parentheses must occur in matching `'('` and `')'` pairs.

---

**Algorithm:**

* There must be an even number of parentheses in total.
* First parenthesis must be `'('` and the last one must be `')'`.
* Need to extract just the parentheses into a single array.
* Then iterate over the elements of the array, storing each element under a current variable name so that the next element is compared to the current one: if the two are the same then continue to the next iteration; but if they are different (i.e. `'('` and `')'` ) then, those two can be deleted and we break from the iteration only to repeat again from the beginning.  

---

**Code:**

```ruby
def balanced?(string)
  parentheses = string.chars.select { |char| char == '(' || char == ')' }.join

  loop do
    if parentheses.match?(/\(\)/)
      parentheses.sub!(/\(\)/, '')
    else
      break
    end
  end

  parentheses.empty?
end
```

---

**Launch School Solution:**

```ruby
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end
```

---

**Further Exploration:**

There are a few other characters that should be matching as well. Square brackets and curly brackets normally come in pairs. Quotation marks (single and double) also typically come in pairs and should be balanced. Can you expand this method to take into account those characters?

```ruby
def balanced_par?(string)
  parentheses = string.chars.select { |char| char == '(' || char == ')' }.join

  loop do
    if parentheses.match?(/\(\)/)
      parentheses.sub!(/\(\)/, '')
    else
      break
    end
  end

  parentheses.empty?
end

def balanced_sqr?(string)
  sqr_brack = string.chars.select { |char| char == '[' || char == ']' }.join

  loop do
    if sqr_brack.match?(/\[\]/)
      sqr_brack.sub!(/\[\]/, '')
    else
      break
    end
  end

  sqr_brack.empty?
end

def balanced_curl?(string)
  curly = string.chars.select { |char| char == '{' || char == '}' }.join

  loop do
    if curly.match?(/\{\}/)
      curly.sub!(/\{\}/, '')
    else
      break
    end
  end

  curly.empty?
end

def balanced_quotes?(string)
  words = string.split
  quote_words = words.select do |word|
    word[0] == "'" || word[0] == "\"" || word[-1] == "'" || word[-1] == "\""
  end
  quote_words_chars = quote_words.join.chars
  quotes_str = quote_words_chars.select { |char| char == "'" || char == "\"" }.join  
  
  loop do
    if quotes_str.match?(/\'\'/)
      quotes_str.sub!(/\'\'/, '')
    elsif quotes_str.match?(/\"\"/)
      quotes_str.sub!(/\"\"/, '')
    else
      break
    end
  end
    
  quotes_str.empty?
end

def balanced?(string)
  balanced_par?(string) && balanced_sqr?(string) && balanced_curl?(string) && balanced_quotes?(string)
end
```

