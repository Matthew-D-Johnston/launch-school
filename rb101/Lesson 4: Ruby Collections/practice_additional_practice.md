Lesson 4: Ruby Collections
==========================
## Practice Problems: Additional Practice

**Practice Problem 1**

Given the array below
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```
Turn this array into a hash where the names are the keys and the values are the positions in the array.

My response:
```ruby
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
```
Launch School response:

Identical to mine.

**Practice Problem 2**

Add up all of the ages from the Munster family hash:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```
My response:
```ruby
sum_of_ages = 0
ages.each do |key, value|
  sum_of_ages + value
end
```
Launch School response:

One solution would be to assign a variable to an intial value of `0` and then iterate through the Hash adding each value in turn to the total.
```ruby
total_ages = 0
ages.each { |_, age| total_ages += age }
total_ages # => 6174
```
Another option would be to use a `Enumerable#inject` method.
```ruby
ages.values.inject(:+) # => 6174
```
This uses `ages.values` to make an array, then uses the `inject` method which is part of the `Enumberable` module. The strange-looking parameter to inject is simply a variety of the `inject` method which says "apply the `+` operator to the accumulator and object parameters of `inject`".

**Practice Problem 3**

In the age hash:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```
throw out the really old people (age 100 or older).

My response:
```ruby
ages.delete_if { |_, age| age >= 100 }
```
Launch School response:
```ruby
ages.keep_if { |_, age| age < 100 }
```
You could also use `#select!` here. When using similar methods however, it is important to be aware of the subtle differences in their implementation. For example, the [Ruby Documentation](http://ruby-doc.org/core-2.6.3/Hash.html#method-i-select-21) for `Hash#select!` tells us that it is "Equivalent to `Hash#keep_if`, but returns `nil` if no changes were made," though in this case that wouldn't have made any difference.

**Practice Problem 4**

Pick out the minimum age from our current Munster family hash:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```
My response:
```ruby
ages.values.sort.first
```
Launch School response:
```ruby
ages.values.min
```
**Practice Problem 5**

In the array:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```
Find the index of the first name that starts with "Be"

My response:
```ruby
be_name = ''
flintstones.each_with_index do |name, index|
  be_name = index if name[0] == 'B' && name[1] == 'e'
end

be_name
```
or
```ruby
flintstones.bsearch_index do |name|
  name[0] == 'B' && name[1] == 'e'
end
```
Launch School response:
```ruby
flintstones.index { |name| name[0, 2] == "Be" }
```
**Practice Problem 6**

Amend this array so that the names are all shortened to just the first three characters:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```
My response:
```ruby
flintstones.map { |name| name[0, 3] }
```
or, using a method that will mutate the original array...
```ruby
flintstones.each { |name| name.slice!(3..-1) }
```
Launch School response:
```ruby
flintstones.map! do |name|
  name[0, 3]
end
```
This could also be done in a single line:
```ruby
flintstones.map! { |name| name[0, 3] }
```
**Practice Problem 7**

Create a hash that expresses the frequency with which each letter occurs in this string:
```ruby
statement = "The Flintstones Rock"
```
My response:
```ruby
letter_frequency = Hash.new(0)
statement.split('').each do |letter|
  letter_frequency[letter] += 1 unless letter == ' '
end
```
Launch School response:
```ruby
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
```
**Practice Problem 8**

What happens when we modify an array while we are iterating over it? What would be output by this code?
```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```
What would be output by this code?
```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```
My response:

For the first one:
```ruby
1
3
```
Because `shift` removes the first element of the array and returns it, the next iteration will skip what would have been the next printed number.

For the second one:
```ruby
1
2
```
Because `pop` removes the last element of the array, the array is shrinking by one after each iteration, thus following the printing of the second elment the last invocation of `pop` effectively removes the last element of the array, allowing for no further iterations. 

Launch School response:
first one...
```ruby
1
3
```
second one...
```ruby
1
2
```
**Practice Problem 9**

As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself... `titleize`. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:
```ruby
words = "the flintstones rock"
```
would be:
```ruby
words = "The Flintstones Rock"
```
Write your own version of the rails `titlesize` implementation.

My response:
```ruby
def titleize(string)
  capitalized = []
  string.split.each { |word| capitalized << word.capitalize }
  capitalized.join(' ')
end
```
Launch School response:
```ruby
words.split.map { |word| word.capitalize }.join(' ')
```
**Practice Problem 10**

Given the `munsters` hash below
```ruby
munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female"},
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female" }
}
```
Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of the three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below
```ruby
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => { "age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
```
Note: a kid is in the age range 0-17, an adult is in the range 18-64 and a senior is aged 65+.

My response:
```ruby
munsters.values.map do |inner_hash|
  if (0..17).include?(inner_hash["age"])
    inner_hash["age_group"] = "kid"
  elsif (18..64).include?(inner_hash["age"])
    inner_hash["age_group"] = "adult"
  else
    inner_hash["age_group"] = "senior"
  end
end
```
Launch School response:
```ruby
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
```
