Lesson 3: Practice Problems
===========================
## Practice Problems: Hard 1
-----------------------------
**Question 1:**
---------------
What do you expect to happen when the `greeting` variable is referenced in the last line of the code below?  
```ruby
if false
  greeting = "hello world"
end

greeting
```
**My Response:**  

I expect nothing to be returned since the `if` conditional evaluates whatever expression follows it and if the expression evaluates to `true` then the code that applies to that condition will be executed, but if the expression evaluates to `false`, then that bit of code will not be executed. Since the expression is an explicit `false` the code `greeting = "hellow world"` will not be executed. Thus, there is no object attached to the variable `greeting`.  
After running the code in irb, I see that both the `if` expression and the `greeting` variable return a value of `nil`. When I run Ruby code in the command line and try to `puts` the `greeting` variable, nothing is printed.  

**Launch School's Solution:**

`greeting` is `nil` here, and no "undefined method or local variable" exception is thrown. Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it's undefined. However, when you initialize a local variable within an `if` block, even if that `if` block doesn't get executed, the local variable is initialized to `nil`.  

**Question 2:**
---------------
What is the result of the last line in the code below?  
```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```
**My Response:**  

My initial guess: Since `greetings[:a]` is what `informal_greeting` references, and `greetings[:a]` evaluates to `'hi'`, the use of the `<<` operator on `informal_greeting` adds `' there'` to `'hi'`, but not to the original `greetings` hash. Therefore, the `greetings` hash is unmodified and the final line of code should print out `{:a=>"hi"}`.  

After executing the code in irb, I find that I was mistaken. The final output is `{:a=>"hi there"}`. Thus, because `informal_greeting` references the value object `hi` within the `greetings` hash, that object was permanently mutated by the `<<` operator.  

**Launch School's Solution:**  

The output is `{:a=>"hi there"}`. The reason is because `informal_greeting` is a reference to the original object. The line `informal_greeting << ' there'` was using the `String#<<` method, which modifies the object that called it. This means that the original object was changed, thereby impacting the value in `greetings`. If instead of modifying the original object, we wanted to only modify `informal_greeting` but not `greetings`, there are a couple of options:  

* we could initialize `informal_greeting` with a reference to a new object containing the same value by `informal_greeting = greetings[:a].clone`.
* we can use string concatenation, `informal_greeting = greetings[:a] + ' there'`, which returns a new `String` object instead of modifying the original object.  

**Question 3:**
---------------
In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.  

To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.  

What will be printed by each of these code groups?  

A)  
```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
B)  
```ruby
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
C)  
```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
**My Response:**  

A)  
```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"       # => one is: two
puts "two is: #{two}"       # => two is: three
puts "three is: #{three}"   # => three is: one
```
Thus, my guess is...
```
one is: two
two is: three
three is: one
```
After running the code, I realize that the variables `one`, `two`, and `three` remain unchanged after being passed through the `mess_with_vars` method. That this occurs becomes obvious if I change the method parameters to something else like say `a`, `b`, and `c`. This may even be a case of variable shadowing, where I am unable to even access the variables defined in the outer scope due to the way the paramgers are named.  

B)  
```ruby
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
My guess is...
```
one is one
two is two
three is three
```
After running the code, my suspicion was confirmed.  

C)
```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
My guess is...  
```
one is: two
two is: three
three is: one
```
After running the code, my suspicion was confirmed.  

**Launch School's Solution:**  

A)  
```
"one is: one"
"two is: two"
"three is: three"
```
B)  
```
"one is: one"
"two is: two"
"three is: three"
```
C)  
```
"one is: two"
"two is: three"
"three is: one"
```
**Question 4:**
---------------
Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called `is_an_ip_number?` that determines if a string is a numeric string between `0` and `255` as required for IP numbers and asked Ben to use it.  
```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```
Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."  

Help Ben fix his code.  

**My Response:**  

First, we define the `is_an_ip_number?` provided by Alyssa:
```ruby
def is_an_ip_number?(string)
  return false if string.to_i.to_s != string
  (0..255).include?(string.to_i)
end
```
Then, we fix Ben's `dot_separated_ip_address?`:
```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop

    if is_an_ip_number?(word)
      next
    else
      return false
    end
  end
  
  true
end
```
Which should return `true` for the following expressions:
```ruby
puts dot_separated_ip_address?("234.45.2.6") == true
puts dot_separated_ip_address?("255.3.9") == false
puts dot_separated_ip_address?("0.245.34.56.21") == false
puts dot_separated_ip_address?("43.256.43.21") == false
puts dot_separated_ip_address?("1.2.3.4") == true
puts dot_separated_ip_address?("hallo") == false
```
**Launch School's Solution:**  

There are several ways to fix this. To determine if there are exactly 4 dot-separated "words" in the string, you can simply add a check for `dot_separated_words.size` after splitting the string.  

The other error in Ben's code is that instead of returning false upon encountering a non-numeric component, he used `break` to break out of the while loop. Once he breaks, control falls through to the `return true` statement. He can fix this by performing `return false` instead of `break`.  
```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
```
Note: Ben's original `return true` on the last line of the method can be shortened to just `true`. This is because Ruby returns the result of the last evaluated expression.
