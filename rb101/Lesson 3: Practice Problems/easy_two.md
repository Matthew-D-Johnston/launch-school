Lesson 3: Practice Problems
===========================
## Practice Problems: Easy 2
-----------------------------
**Question 1:**
---------------
In this hash of people and their age,
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```
see if "Spot" is present.  
**Bonus:** What are two other hash methods that would work just as well for this solution?  

**My Response:**
```ruby
ages.include?("Spot")   # => false
# for the bonus question:
ages.key?("Spot")       # => false
ages.has_key?("Spot")   # => false
```
**Launch School's Solution:**
```ruby
ages.key?("Spot")
```
**Bonus Answer:**  
`Hash#include?` and `Hash#member?`  

**Question 2:**
---------------
Starting with this string:  
```ruby
munsters_description = "The Munsters are creepy in a good way."
```
Convert the string in the following ways (code will be executed on original `munsters_description` above):  
```ruby
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```
**My Response:**  
```ruby
# 1:
munsters_description.upcase!.gsub!('TH', 'tH').gsub!('M', 'm')

# 2: 
munsters_description.downcase!.gsub!('th', 'Th')

# 3:
munsters_description.downcase!

# 4:
munsters_description.upcase!
```
**Launch School's Solution:**  
```ruby
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!
```

**Question 3:**
---------------
We have most of the Munster family in our age hash:  
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```
add ages for Marilyn and Spot to the existing hash  
```ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```
**My Response:**
```ruby
ages.merge!(additional_ages)
```
**Launch School's Solution:**
```ruby
ages.merge!(additional_ages)
```

**Question 4:**
---------------
See if the name "Dino" appears in the string below:  
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
**My Response:**  
```ruby
advice.include?("Dino")
```
**Launch School's Solution:**
```ruby
advice.match?("Dino")

# Note that this is not a perfect solution, as it would match any substring with Dino in it.
```

**Question 5:**
---------------
Show an easier way to write this array:  
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```
**My Reponse:**  
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```
**Launch School's Solution:**  
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

**Question 6:**
---------------
How can we add the family pet "Dino" to our usual array:  
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```
**My Response:**  
```ruby
flintstones.push('Dino')
```
**Launch School's Solution:**  
```ruby
flintstones << "Dino"
```

**Question 7:**
---------------
In the previous practice problem we added Dino to our array like this:  
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```
We could have used either `Array#concat` or `Array#push` to add Dino to the family.  
How can we add multiple items to our array? (Dino and Hoppy)  
**My Response:**  
```ruby
flintstones.push("Dino", "Hoppy")
```
**Launch School's Solution:**  
```ruby
flintstones.push("Dino").push("Hoppy") # push returns the array so we can chain
```
or  
```ruby
flintstones.concat(%w(Dino Hoppy)) # concat adds an array rather than one item
```

**Question 8:**
---------------
Shorten this sentence:  
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
...remove everything starting from "house".  
Review the [`String#slice!`](http://ruby-doc.org/core-2.2.0/String.html#method-i-slice-21) documentation, and use that method to make the return value `"Few things in life are as important as "`. But leave the `advice` variable as `"house training your pet dinosaur."`.  
As a bonus, what happens if you use the [`String#slice`](http://ruby-doc.org/core-2.2.0/String.html#method-i-slice) method instead?  
**My Response:**  
```ruby
advice.slice!("Few things in life are as important as ")
```
Bonus: using the `String#slice` method instead will leave `advice` unchanged.  
**Launch School's Solution:**
```ruby
advice.slice!(0, advice.index('house'))
```

**Question 9:**
---------------
Write a one-liner to count the number of lower-case 't' characters in the following string:  
```ruby
statement = "The Flintstones Rock!"
```
**My Response:**  
```ruby
statement.count('t')
```
**Launch School's Solution:**  
```ruby
statement.count('t')
```

**Question 10:**
----------------
Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with space?  
```ruby
title = "Flintstone Family Members"
```
**My Response:**  
```ruby
title.center(40)
```
**Launch School's Solution:**  
```ruby
title.center(40)
```


