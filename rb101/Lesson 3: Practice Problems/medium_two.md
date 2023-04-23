Lesson 3: Practice Problems
===========================
## Practice Problems: Medium 2
------------------------------
**Question 1:**
---------------
Every named entity in Ruby has an `object_id`. This is a unique identifier for that object.  

It is often the case that two different things "look the same", but they can be different objects. The "under the hood" object referred to by a particular named-variable can change depending on what is done to that named-variable.  

In other words, in Ruby everything is an object...but it is not always THE SAME object. Predict how the values and object ids will change throughout the flow of the code below:  
```ruby
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end
```
**My Response:** 
```ruby
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

1.times do
    a_outer_inner_id = a_outer.object_id  # a_outer_inner_id == a_outer_id
    b_outer_inner_id = b_outer.object_id  # b_outer_inner_id == b_outer_id
    c_outer_inner_id = c_outer.object_id  # c_outer_inner_id == c_outer_id
    d_outer_inner_id = d_outer.object_id  # d_outer_inner_id == d_outer_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    puts

    a_outer = 22               # The value of `a_outer` is changed along with its object_id.
    b_outer = "thirty three"   # The value of `b_outer` is changed along with its object_id.
    c_outer = [44]             # The value of `c_outer` is changed along with its object_id.
    d_outer = c_outer[0]       # The value of `d_outer` is changed along with its object_id.

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts


    a_inner = a_outer          # `a_inner` = 22
    b_inner = b_outer          # `b_inner` = "thirty three"
    c_inner = c_outer          # `c_inner` = [44]
    d_inner = c_inner[0]       # `d_inner` = 44

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)." # inner and outer IDs are the same
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)." # inner and outer IDs are the same
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)." # inner and outer IDs are the same
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)." # inner and outer IDs are the same
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."   # a_outer = 22; ID before != ID after
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."   # b_outer = "thirty three"; ID before != ID after
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."   # c_outer = [44]; ID before != ID after
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."   # d_outer = 44; ID before != ID after
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # error: a_inner was only defined inside the block
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # error: b_inner was only defined inside the block
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # error: c_inner was only defined inside the block
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # error: d_inner was only defined inside the block
end
```
**Launch School's Solution**  
```ruby
a_outer is 42 with an id of: 85 before the block.
b_outer is forty two with an id of: 2152729580 before the block.
c_outer is [42] with an id of: 2152729540 before the block.
d_outer is 42 with an id of: 85 before the block.
```
Notice that Ruby re-used the "42 object with id 85" when the value was the same.  
```ruby
a_outer id was 85 before the block and is: 85 inside the block.
b_outer id was 2152729580 before the block and is: 2152729580 inside the block.
c_outer id was 2152729540 before the block and is: 2152729540 inside the block.
d_outer id was 85 before the block and is: 85 inside the block.
```
Notice that Ruby did NOT change the id for any of the objects between outside and inside the block.  
```ruby
a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 2152729580 before and: 2152728320 after.
c_outer inside after reassignment is [44] with an id of: 2152729540 before and: 2152728280 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.
```
Notice that changing the values has forced Ruby to create new objects and refer to them with the original variable names.  
```ruby
a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).
b_inner is thirty three with an id of: 2152728320 inside the block (compared to 2152728320 for outer).
c_inner is [44] with an id of: 2152728280 inside the block (compared to 2152728280 for outer).
d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer).
```
Notice that Ruby re-uses the objects under the hood when it can, but uses different ones for different values.  
```ruby
a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block.
b_outer is thirty three with an id of: 2152729580 BEFORE and: 2152728320 AFTER the block.
c_outer is [44] with an id of: 2152729540 BEFORE and: 2152728280 AFTER the block.
d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block.
(notice that each variable keeps its new object/object_id even when we leave the block.)

 => "ugh ohhhhh"
```
Notice that once we leave the block, those variables that were defined inside the block lose their meaning.  

**Question 2:**  
---------------
Let's look at object id's again from the perspective of a method call instead of a block.  

Here we haven't changed ANY of the code outside or inside of the block/method. We simply took the contents of the block from the previous practice problem and moved it to a method, to which we are passing all of our outer variables.  

Predict how the values and object ids will change throughout the flow of the code below:
```ruby
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0] # => 42

  a_outer_id = a_outer.object_id  # => 85
  b_outer_id = b_outer.object_id  # => 70309273769720
  c_outer_id = c_outer.object_id  # => 70309273721160
  d_outer_id = d_outer.object_id  # => 85

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."


  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."


  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"


end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id  # => 85
  b_outer_inner_id = b_outer.object_id  # => 70309273769720
  c_outer_inner_id = c_outer.object_id  # => 70309273721160
  d_outer_inner_id = d_outer.object_id  # => 85

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."

  a_inner = a_outer     # => 22
  b_inner = b_outer     # => "thirty three"
  c_inner = c_outer     # => [44]
  d_inner = c_inner[0]  # => 44

  a_inner_id = a_inner.object_id  # => 45
  b_inner_id = b_inner.object_id  # => 70309274010920
  c_inner_id = c_inner.object_id  # => 70309273869760
  d_inner_id = d_inner.object_id  # => 89

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."

end
```
**My Response:**  

Running the `fun_with_ids` method:
```ruby
# => "a_outer is 42 with an id of: 85 before the block."  (correct)
# => "b_outer is forty two with an id of: 70309273769720 before the block." (correct, but id: 70143779649080)
# => "c_outer is [42] with an id of: 70309273721160 before the block." (correct, but id: 70143779649180)
# => "d_outer is 42 with an id of: 85 before the block." (correct)
```
All of the above predictions proved correct.  
```ruby

# => "a_outer id was 85 before the method and is: 85 inside the method." (correct)
# => "b_outer id was 70309273769720 before the method and is: 70309273769720 inside the method." (correct: ids the same)
# => "c_outer id was 70309273721160 before the method and is: 70309273721160 inside the method." (correct: ids the same)
# => "d_outer id was 85 before the method and is: 85 inside the method." (correct)
```
All of the above predictions proved correct.  
```ruby

# => "a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after." (correct)
# => "b_outer inside after reassignment is thirty three with an id of: 70309273769720 before and: 70309274010920 after." (correct: new 'after' id: 70143779634540)
# => "c_outer inside after reassignment is [44] with an id of: 70309273721160 before and: 70309273869760 after." (correct: new 'after' id: 70143779634520)
# => "d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after." (correct)
```
All of the above predictions proved correct.  
```ruby

# => "a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer)." (correct)
# => "b_inner is thirty three with an id of: 70309274010920 inside the method (compared to 70309274010920 for outer)." (correct: ids are the same)
# => "c_inner is [44] with an id of: 70309273869760 inside the method (compared to 70309273869760 for outer)." (correct: ids are the same)
# => "d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer)." (correct)
```
All of the above predictions proved correct.  
```ruby

# => "a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the method call." (incorrect: a_outer still refers to 42)
# => "b_outer is thirty three with an id of: 70309273769720 BEFORE and: 70309274010920 AFTER the method call." (incorrect)
# => "c_outer is [44] with an id of: 70309273721160 BEFORE and: 70309273869760 AFTER the method call." (incorrect)
# => "d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the method call." (incorrect)
```
All of the above predictions proved INCORRECT. The `an_illustrative_method` did not permanently reassign `a_outer`, `b_outer`, `c_outer`, and `d_outer`, contrary to my expectations. 
```ruby
# => "ugh ohhhhh"
# => "ugh ohhhhh"
# => "ugh ohhhhh"
# => "ugh ohhhhh"
```
All of the above predictions proved correct.  

**Launch School's Solution:**  
```
a_outer is 42 with an id of: 85 before the block.
b_outer is forty two with an id of: 2152753560 before the block.
c_outer is [42] with an id of: 2152753540 before the block.
d_outer is 42 with an id of: 85 before the block.
```
Notice that this works the same as before. No big surprise.  
```
a_outer id was 85 before the method and is: 85 inside the method.
b_outer id was 2152753560 before the method and is: 2152753560 inside the method.
c_outer id was 2152753540 before the method and is: 2152753540 inside the method.
d_outer id was 85 before the method and is: 85 inside the method.
```
This is also the same as before. These "outers" are NOT the same variables as those outside, Ruby is simply re-using the objects, as these new variables have the same values as the ones outside.  
```
a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 2152753560 before and: 2152752300 after.
c_outer inside after reassignment is [44] with an id of: 2152753540 before and: 2152752280 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.
```
As before with the block version of this practice problem, when we change the values of our "outers", Ruby uses new objects for these variables to deal with their new values.  

One important difference to note is that before, we saw Ruby re-using the "42" object and just giving it a new value inside the block. Why the difference? It should become clear a couple of paragraphs later in this solution...  
```
a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer).
b_inner is thirty three with an id of: 2152752300 inside the method (compared to 2152752300 for outer).
c_inner is [44] with an id of: 2152752280 inside the method (compared to 2152752280 for outer).
d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer).
```
No big surprise here...Ruby is re-using objects that have the same values...  
```
a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
b_outer is forty two with an id of: 2152753560 BEFORE and: 2152753560 AFTER the method call.
c_outer is [42] with an id of: 2152753540 BEFORE and: 2152753540 AFTER the method call.
d_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
```
Wow, look at that. Even though we changed the values of our "outer" variables inside the method call, we still have the same values and the same object id's down here AFTER the method call as we had before it!  

This is because our method call accepts VALUES as parameters. The names we give to those values in the definition of our method are SEPARATE from any other use of those same names.  

We used the same names there for convenience (and admittedly to build some suspense and allow us to clarify this point). We could just as easily have called the first parameter of our method definition a_Fred instead of a_outer.  

The method gets the VALUES of the parameters we pass, but the parameter variables inside the method have no other relationship to those outside of the method. The names were coincidental, and confusing in a useful way.  
```
=> "ugh ohhhhh"
```
Our main method STILL has no access to variables that are defined inside of the method.  

**Question 3:**
---------------
Let's call a method, and pass both a string and an array as parameters and see how even though they are treated in the same way by Ruby, the results can be different.  

Study the following code and state what will be displayed...and why:  
```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
**My Response:**  

Running the code...
```
=> "My string looks like this now: pumpkins"
=> "My array looks like this now: ["pumpkins", "rutabaga"]"
```
Both predictions above were proven correct when run through irb. The `my_string` string was not changed because `+=` is not a destructive operation. However, the `my_array` array was changed because `<<` is a destructive operation.  

**Launch School's Solution:**  

Our output will look like this:  
```
My string looks like this now: pumpkins
My array looks like this now: ["pumpkins", "rutabaga"]
```
Why? It seems clear from the above that Ruby treats string and array parameters differently...but not so fast. Actually the parameters are treated in exactly the same way...but the results are different.  

In both cases, Ruby passes the parameter "by value", but unlike some other languages, the value that gets passed is a reference to some object. The string parameter is passed to the method as a reference to an object of type String. Similarly, the array is passed to the method as a reference to an object of type Array.  

The important distinction is that while a reference is passed, the method initializes a new local variable for both the string and the array and assigns each reference to the new local variables. These are variables that only live within the scope of the method definition.  

So if both parameters live inside the method as a new variable that stores a reference to the passed object...why don't the string and the array behave the same way in our output?  

The difference lies in what Ruby does when the program executes either a `String#+=` operation or an `Array#<<` operation.  

The `String#+=` operation is re-assignment and **creates a new `String` object**. The reference to this new object is assigned to `a_string_param`. The local variable `a_string_param` now points to `"pumpkinsrutabaga"`, not `"pumpkins"`. It has been reassigned by the `String#+=` operation. This means that `a_string_param` and `my_string` no longer point to the same object.  

With the array, one array object can have any number of elements. When we attach an additional element to an array using the `<<` operator, Ruby simply keeps using the same object that was passed in, and appends the new element to it.  

So, because the local variable `an_array_param` still points to the original object, the local variables `my_array` and `an_array_param` are still pointing at the same object, and we see the results of what happened to the array "outside" of the method.  

**Question 4:**
---------------
To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.  
```ruby
def trick_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
**My Response:**  

Running the code...
```
My string looks like this now: pumpkinsrutabaga
My array looks like this now: ["pumpkins"]
```
**Launch School's Solution:**  
```
My string looks like this now: pumpkinsrutabaga
My array looks like this now: ["pumpkins"]
```
As you can see, we have achieved the opposite effect from our last example.  

We are still passing in the same two string and array parameters, but the results are the opposite, because our method does the "same thing" to each, but in a different way than before. That is, in both cases, the method attempts to change the string from `"pumpkins"` to `"pumpkinsrutabaga"` and add `"rutabaga"` to the array.  

Despite the similarity of the results _inside_ the method definition, the results outside the method definition are the opposite.  

As before, the explanation is all about what Ruby does with local variables when we change the object it points to. Does it create a new local variable? Or is it able to just modify the existing object?  

With `Array#=` assignment, our literal `['pumpkins', 'rutabaga']` array is a **new object**, and we are assigning it to the local variable `an_array_param`.  

**Question 5:**
---------------
Depending on a method to modify its arguments can be tricky:  
```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
Whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.  

How can we refactor this practice problem to make the result easier to predict and easier for the next programmer to maintain?  

**My Response:**  

In order to make the result easier to predict, we keep the method consistent with how it treats the original objects. That means, if we want it to mutate the original objects then we should have the method mutate both, instead of just one or the other. Similarly, if we want the original objects to remain unchanged, we should do that for both, rather than only one.  

As for making it easier for a programmer to maintain, it's probably easier to have the method not mutate the original objects. That way, the method does not have unexpected effects later on in the program. If the programmer decides that mutating the original objects for their specific program is desirable, then they can make this change and be prepared for unintended effects.  

Thus, we have...
```ruby
def tricky_method(a_string_param, an_array_param)
  puts a_string_param += "rutabaga"
  p an_array_param + ["rutabaga"]
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
**Launch School's Solution:**  
```ruby
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
Every language (Ruby included) provides ways and means of writing "clever" code that depends on some of the less obvious traits of the language.  

Every good programmer practices these tricks...and then avoids them like the plague.  

Clever programmers don't write "clever" code. They write explicit code that is easy to read, debug and modify as the requirements change.  

**Question 6:**
---------------
How could the unnecessary duplication in this method be removed?  
```ruby
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
```
**My Response:**  
```ruby
def color_valid(color)
  return true if ["blue", "green"].include?(color)
  false
end
```
**Launch School's Solution:**  

Ruby will automatically evaluate statements, so this method:  
```ruby
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
```
Can be significantly simplified by changing it to just:  
```ruby
def color_valid(color)
  color == "blue" || color == "green"
end
```
Both of these methods do exactly the same thing--but one is much more complex to read.  
