Lesson 3: Practice Problems
===========================
## Practice Problems: Easy 1
-----------------------------
**Question 1:**
---------------
What would you expect the code below to print out?  
```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```
**My Response:**  
1  
2  
2  
3  
The `uniq` method is not a destructive method, meaning it does not mutate the caller. 

**Launch School Solution:**  
Correct. Also, had the last line been `p numbers` instead, the output would have been `[1, 2, 2, 3]` because the `p` method automatically calls `inspect` on its agrument, which gives a different formatting on the output. Furthermore, we could have also done `puts numbers.inspect` and the output would have been the same as using the `p` method.

**Question 2:**
---------------
Describe the difference between `!` and `?` in Ruby. And explain what would happen in the following scenarios:  
1. what is `!=` and where should you use it?
2. put `!` before something, like `!user_name`
3. put `!` after something, like `words.uniq!`
4. put `?` before something
5. put `?` after something
6. put `!!` before something, like `!!user_name`

**My Response:**   
The `!` is used to permanently mutate a Ruby object. It can be appended to a method call so that it mutates the caller of the method. The `?` is appended to certain methods, which will return a boolean object; it can also be used in the 'ternary operator', where it also evaluates to a boolean; when prepending a single character (e.g. 5 or j), it will return a `String` version of that character.  
1. `!=` is the 'not equal to' comparison operator. It is used to compare equivalence of two Ruby objects, returning `true` if the two objects are not equal and `false` if the two objects are equal.
2. `!` is a 'not' or 'negation' operator whenever it is placed in front of, or prepending, a Ruby object. `!true` returns `false` and `!false` returns `true`. For many Ruby objects, which are 'truthy', it will return `false` when it prepends them. Of course, `!nil` returns `true`. In the case of `!user_name`, if `user_name` is undefined then an error message will be returned. However, if `user_name` is a variable name that is assigned to one of Ruby's 'truthy' objects then it will return `false`. If it is assigned to `false` or `nil`, it will return `true`. 
3. `!` is known as the 'bang' operator whenever it appends a method call. It causes the method being called to act destructively by mutating the caller. For example, assuming that `words` is say some `Array` object containing individual string objects as its elements, then `words.uniq` will return a modified array containing only the unique elements of the `words` array; that is, there will no longer be any duplicate strings in the `Array` object if there were any to begin with. Appending `words.uniq` with `!`, as in `words.uniq!` will not only return an `Array` similar to the one just described, but it will also permanently modify the `words` array, eliminating the duplicate elements.
4. When `?` prepends a single character like `5` or `j`, it will return a `String` version of that character (i.e. `"5"` and `"j"`). However, if it prepends more than a single character, like `52` or `jo`, it will only return an error message. When used in the 'ternary operator', `?` comes just before the value that is to be returned if the initial condition of the operator evaluates to `true`. 
5. `?` appends certain method calls which return a boolean value. For example, if the `include?` method is called on a `String` or an `Array` object it will check to see if the argument that was supplied is _included_ within the object in question, returning `true` if it is _included_ and `false` otherwise. In the 'ternary' operator, `?` follows the initial condition that is being evaluated.
6. `!!` is a double negation operator, returning a boolean. For example, `!!true` returns `true`, whereas `!!false` and `!!nil` return `false`. For Ruby's 'truthy' objects prependend by `!!`, the return value will be `true`. For `user_name` acting as a defined variable name, `!!user_name` will return `true`; if `user_name` is undefined, then `!!user_name` will simply return an error message.

**Question 3:**
---------------
Replace the word "important" with "urgent" in this string:  
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
**My Response:**  
```ruby
separate_words = advice.split
separate_words[separate_words.find_index('important')] = 'urgent'
rejoin_words = separate_words.join(' ')

puts rejoin_words
# => "Few things in life are as urgent as house training your pet dinosaur."
```
**Launch School Solution:**  
```ruby
advice.gsub!('important', 'urgent')
```

**Question 4:**
---------------
The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:  
```ruby
numbers = [1, 2, 3, 4, 5]
```
What do the following method calls do (assume we reset `numbers` to the original array between method calls)?  
```ruby
numbers.delete_at(1)
numbers.delete(1)
```
**My Response:**  
My initial guess:  
```ruby
numbers.delete_at(1)      # deletes at index 1, which is the number 2.
numbers.delete(1)         # deletes the value 1, which is at index 0.
```
My initial guess was proven to be correct.  

**Question 5:**
--------------- 
Programmatically determine if 42 lies between 10 and 100.  
_hint: Use Ruby's range object in your solution._  

**My Response:**  
```ruby
(10..100).include?(42)    # => true
```
**Launch School Solution:**  
```ruby
(10..100).cover?(42)      # => true
```

**Question 6:**
---------------
Starting with the string:  
```ruby
famous_words = "seven years ago..."
```
show two different ways to put the expected "Four score and " in front of it.  
**My Response:**  
```ruby
"Four score and " << famous_words # => "Four score and seven years ago..."
"Four score and " + famous_words  # => "Four score and seven years ago..."
```
**Launch School's Solution:**  
They have the two I did plus one extra:  
```ruby
famous_words.prepend("Four score and ")
```

**Question 7:**
---------------
Fun with gsub:  
```ruby
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
```
This gives us a string that looks like a "recursive" method call:  
```ruby
"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
```
If we take advantage of Ruby's `Kernel#eval` method to have it execute this string as if it _were_ a "recursive" method call:  
```ruby
eval(how_deep)
```
what will be the result?  

**My Response:**  
The result will be `42`.  

**Launch School's Result:**  
`42`  

**Question 8:**
--------------- 
If we build an array like this:  
```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```
We will end up with this "nested" array:  
```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```
Make this into an un-nested array.  

**My Response:**  
```ruby
flintstones.flatten
```
**Launch School's Solution:**  
```ruby
flintstones.flatten!
```

**Question 9:**
---------------
Given the hash below  
```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```
Turn this into an array containing only two elements: Barney's name and Barney's number. 
 
**My Response:**  
```ruby
flintstones = flintstones.select { |k, v| k == "Barney" }.flatten # => ["Barney", 2]
```
**Launch School's Solution:**  
```ruby
flintstones.assoc("Barney")   # => ["Barney", 2]
```




